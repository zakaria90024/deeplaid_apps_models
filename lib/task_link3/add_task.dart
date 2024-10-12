import 'package:flutter/material.dart';

import 'add_task_item.dart';

class ListEditScreen extends StatefulWidget {
  @override
  _ListEditScreenState createState() => _ListEditScreenState();
}

class _ListEditScreenState extends State<ListEditScreen> {
  String listTitle = "Untitled List (0)";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        elevation: 0, // Remove shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  listTitle = value.isNotEmpty ? "$value (${_controller.text.length})" : "Untitled List (0)";
                });
              },
              decoration: InputDecoration(
                hintText: listTitle,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  // Tasks can be added here
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AddTaskItemInput()),
            );
            // Add your onTap action here
            print('Add a Task tapped');
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                  offset: Offset(0, 2), // Shadow position
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.cyan,
                  radius: 12,
                  child: Icon(Icons.add, color: Colors.white, size: 16),
                ),
                SizedBox(width: 10),
                Text(
                  'Add a Task',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

