import 'package:deeplaid_apps_models/task_link3/sensor_tracking.dart';
import 'package:deeplaid_apps_models/task_link3/splash.dart';
import 'package:flutter/material.dart';


// class MyAppA extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
                // Action for A To-Do List
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                minimumSize: Size(200, 50), // width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'A To-Do List',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20), // Space between the buttons

            // Second button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder: (context) => SensorApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(200, 50), // width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Sensor Tracking',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
