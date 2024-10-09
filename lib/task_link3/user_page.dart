import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class MyAppSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Database Example',
      home: UserTableScreen(),
    );
  }
}

class UserTableScreen extends StatefulWidget {
  @override
  _UserTableScreenState createState() => _UserTableScreenState();
}

class _UserTableScreenState extends State<UserTableScreen> {
  Database? _database;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  // Initialize the database
  Future<void> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'user_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            image TEXT, -- Stores image path or URL
            complete_task INTEGER,
            incomplete_task INTEGER
          )
        ''');
      },
    );
  }

  // Insert a user
  Future<void> _insertUser(String name, String email, String image, int completeTask, int incompleteTask) async {
    await _database?.insert(
      'users',
      {
        'name': name,
        'email': email,
        'image': image, // Add image path or URL here
        'complete_task': completeTask,
        'incomplete_task': incompleteTask,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all users
  Future<List<Map<String, dynamic>>> _getUsers() async {
    return await _database?.query('users') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Table Example'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found.'));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: user['image'] != null
                      ? NetworkImage(user['image']) as ImageProvider<Object>
                      : AssetImage('assets/default_avatar.png') as ImageProvider<Object>,
                ),
                title: Text(user['name']),
                subtitle: Text('Email: ${user['email']}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Completed: ${user['complete_task']}'),
                    Text('Incomplete: ${user['incomplete_task']}'),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Insert a dummy user
          await _insertUser(
            'John Doe',
            'johndoe@example.com',
            'https://example.com/image.jpg', // Sample image URL
            5, // Completed tasks
            3, // Incomplete tasks
          );
          setState(() {}); // Refresh the UI
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
