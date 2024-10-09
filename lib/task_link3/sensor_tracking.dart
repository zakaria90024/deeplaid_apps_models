import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_sensors/flutter_sensors.dart';
import 'dart:async';

class SensorApp extends StatelessWidget {
  const SensorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SensorDataScreen(),
    );
  }
}

class SensorDataScreen extends StatefulWidget {
  const SensorDataScreen({super.key});

  @override
  _SensorDataScreenState createState() => _SensorDataScreenState();
}

class _SensorDataScreenState extends State<SensorDataScreen> {
  List<FlSpot> _gyroX = [];
  List<FlSpot> _gyroY = [];
  List<FlSpot> _gyroZ = [];

  List<FlSpot> _accelX = [];
  List<FlSpot> _accelY = [];
  List<FlSpot> _accelZ = [];

  int _index = 0;
  StreamSubscription? _gyroSubscription;
  StreamSubscription? _accelSubscription;

  final double movementThreshold = 10.0; // Set your threshold here

  @override
  void initState() {
    super.initState();
    _startGyroSensor();
    _startAccelSensor();
  }

  // Function to process and safely handle sensor data
  void _processSensorData(List<double> sensorData) {
    setState(() {
      _gyroX.add(FlSpot(_index.toDouble(), safeValue(sensorData[0])));
      _gyroY.add(FlSpot(_index.toDouble(), safeValue(sensorData[1])));
      _gyroZ.add(FlSpot(_index.toDouble(), safeValue(sensorData[2])));

      // Check for high movement on two axes
      _checkForHighMovement(sensorData[0], sensorData[1], sensorData[2]);

      _index++;
    });
  }

  // Safe handling of sensor values to avoid NaN and Infinity
  double safeValue(double value) {
    if (value.isNaN || value.isInfinite) {
      return 0.0; // Provide a fallback value for invalid data
    }
    return value;
  }

  // Function to check for high movement on two or more axes
  void _checkForHighMovement(double x, double y, double z) {
    int highMovementAxes = 0;

    if (x.abs() > movementThreshold) highMovementAxes++;
    if (y.abs() > movementThreshold) highMovementAxes++;
    if (z.abs() > movementThreshold) highMovementAxes++;

    if (highMovementAxes >= 2) {
      _showAlert();
    }
  }

  // Function to show the ALERT when high movement is detected
  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ALERT'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the alert
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _startGyroSensor() async {
    if (await SensorManager().isSensorAvailable(Sensors.GYROSCOPE)) {
      final stream = await SensorManager().sensorUpdates(
        sensorId: Sensors.GYROSCOPE,
        interval: Sensors.SENSOR_DELAY_UI,
      );

      _gyroSubscription = stream.listen((event) {
        _processSensorData(event.data);
      });
    }
  }

  void _startAccelSensor() async {
    if (await SensorManager().isSensorAvailable(Sensors.ACCELEROMETER)) {
      final stream = await SensorManager().sensorUpdates(
        sensorId: Sensors.ACCELEROMETER,
        interval: Sensors.SENSOR_DELAY_UI,
      );

      _accelSubscription = stream.listen((event) {
        setState(() {
          _accelX.add(FlSpot(_index.toDouble(), safeValue(event.data[0])));
          _accelY.add(FlSpot(_index.toDouble(), safeValue(event.data[1])));
          _accelZ.add(FlSpot(_index.toDouble(), safeValue(event.data[2])));

          // Check for high movement on two axes
          _checkForHighMovement(event.data[0], event.data[1], event.data[2]);
        });
      });
    }
  }

  @override
  void dispose() {
    _gyroSubscription?.cancel();
    _accelSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white, // Set AppBar color to white
        elevation: 0, // Remove shadow under the AppBar if desired
        iconTheme: IconThemeData(
          color: Colors.black, // Set icon color (like back button) to black if necessary
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSensorChart('Gyro', _gyroX, _gyroY, _gyroZ),
            _buildSensorChart('Accelerometer Sensor Data', _accelX, _accelY, _accelZ),
          ],
        ),
      ),
    );
  }

  // Method to build the sensor chart UI with initialization and data checks
  Widget _buildSensorChart(String title, List<FlSpot> dataX, List<FlSpot> dataY,
      List<FlSpot> dataZ) {
    return Padding(
      padding: const EdgeInsets.only(left:12 , top:8, right: 12, bottom: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.only(left:12 , top:8, right: 12, bottom: 8),
          child: Column(
            children: [
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      _buildLineChartBarData(dataX, Colors.red),
                      _buildLineChartBarData(dataY, Colors.green),
                      _buildLineChartBarData(dataZ, Colors.blue),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartBarData _buildLineChartBarData(List<FlSpot> data, Color color) {
    return LineChartBarData(
      spots: data.isNotEmpty ? data : [FlSpot(0, 0)],
      // Fallback if data is empty
      isCurved: true,
      color: color,
      barWidth: 2,
    );
  }
}
