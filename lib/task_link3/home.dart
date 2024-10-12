import 'package:flutter/material.dart';

import 'add_task.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile section with user image, name, and status
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  // User profile image
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_pic.png'), // Make sure the path is correct
                    radius: 25,
                  ),
                  SizedBox(width: 10),

                  // User name and task status
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Zoyeb Ahmed',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '5 incomplete, 5 completed',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Search icon
                  IconButton(
                    onPressed: () {
                      // Action for search button
                    },
                    icon: Icon(Icons.search),
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            // Add more content here if necessary
            Expanded(
              child: Container(
                // This will hold the task list or other content
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),

      // Floating action button
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListEditScreen()),
            );

          },
          backgroundColor: Colors.cyan,
          child: Icon(Icons.add),
          shape: CircleBorder(),
        ),
      ),

    );
  }
}
