import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class AddTaskItemInput extends StatefulWidget {
  final String listTitle;

  AddTaskItemInput({required this.listTitle});

  @override
  _TaskInputScreenState createState() => _TaskInputScreenState();
}

class _TaskInputScreenState extends State<AddTaskItemInput> {
  bool _isChecked = false;
  TextEditingController _taskController = TextEditingController();
  DateTime? _selectedDate;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Function to open date picker and handle date selection
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date as the default
      firstDate: DateTime(2000), // The earliest date allowed
      lastDate: DateTime(2100), // The latest date allowed
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate; // Update the selected date
      });
    }
  }



  @override
  void initState() {
    super.initState();
    // Initialize notification settings
    final initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/logo');
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );


  }

  // Function to show notification
  Future<void> _showNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const platformChannelSpecifics =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Reminder',
      'Today is the day!',
      platformChannelSpecifics,
      payload: 'Notification Payload',
    );
  }

  // Function to check if selected date is today
  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Lists',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.listTitle,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: _taskController,
                        decoration: InputDecoration(
                          hintText: 'Task 1',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Colors.cyan,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications_outlined),
                    onPressed: () {
                      if (_selectedDate != null && _isToday(_selectedDate!)) {
                        _showNotification();
                        print("sdfsdf");// Show notification if the date is today
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Selected date is not today!')),
                        );
                      }
                      // Action for notification icon
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.notes_outlined),
                    onPressed: () {
                      // Action for notes icon
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today_outlined),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.check_circle, color: Colors.cyan),
                    onPressed: () {
                      // Action for adding task
                    },
                  ),
                  SizedBox(height: 20), // Space between row and date text
                  if (_selectedDate != null) // Only show if date is selected
                    Text(
                      '${DateFormat.yMMMd().format(_selectedDate!)}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
