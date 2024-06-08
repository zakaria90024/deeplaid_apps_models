import 'package:flutter/material.dart';
import 'package:deeplaid_apps_models/sqlitehelper_deeplaid_apps/sqlitehelper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/doctor_model.dart';

class DoctorList extends StatefulWidget {
  @override
  State<DoctorList> createState() => _DoctorListState();
}
//try to
class _DoctorListState extends State<DoctorList> {
  late List<dynamic> doctors;
  var dbHelper = DBHelper();
  late List doctorss;
  int productCount = 0;

  @override
  void initState() {
    super.initState();

    // dbHelper = DBHelper();
    // doctors = dbHelper!.getDoctors();
    // Fluttertoast.showToast(msg: "todls${doctors}");

    getDoctorFromLdb();

    //refreshDRList();
  }

  void getDoctorFromLdb() async {
    var productsFuture = dbHelper.getProductvs();

    productsFuture.then((data) {
      setState(() {
        this.doctors = data;
        productCount = data.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctor List",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: buildProductList(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     //goToProductAdd();
      //   },
      //   child: Icon(Icons.call),
      //   tooltip: "",
      // ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
        itemCount: productCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.call,
                  color: Colors.indigoAccent,
                ),
              ),
              title: Text(
                this.doctors[position].strCustomerName,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black),
              ),
              subtitle: Column(
                children: <Widget>[
                  Text(
                    doctors[position].straddress,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  Text(doctors[position].strPhone,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 13, color: Colors.black)),
                ],
              ),
              onTap: () async {
                Uri phoneno =
                    Uri.parse('tel:${this.doctors[position].strPhone}');
                if (await launchUrl(phoneno)) {
                  //dialer opened
                } else {
                  //dailer is not opened
                }
              },
            ),
          );
        });
  }

//
// @override
// Widget build(BuildContext context) {
//   final deviceHight = MediaQuery.of(context).size.height;
//   final deviceWidth = MediaQuery.of(context).size.width;
//   return Scaffold(
//     appBar: AppBar(
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back_ios,
//           color: Colors.white,
//           size: 16,
//         ),
//         onPressed: () => Navigator.of(context).pop(),
//       ),
//       title: const Text(
//         "Doctor List",
//         style: TextStyle(color: Colors.white, fontSize: 17),
//       ),
//     ),
//     body: Center(
//       child: Container(
//         child: Column(
//           children: [
//             //listDoctor(),
//
//           ],
//         ),
//       ),
//     ),
//
//     //body:   listDoctor(),
//   );
// }
//
//

// listDoctor() {
//   return Expanded(
//     child: FutureBuilder(
//       future: doctors,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return dataTablee(snapshot.data as List<DoctorModel>);
//         }
//
//         if (null == snapshot.data) {
//           return const Text("No Data Found");
//         }
//
//         return const CircularProgressIndicator();
//       },
//     ),
//   );
// }

//
// ListView dataTablee (List<DoctorModel> doctors){
//
//   return ListView(
//     children: [
//        ListView.builder(
//         itemCount: doctors.length,
//         itemBuilder: (context, position) {
//
//           return Text('This is list item ${position + 1}');
//         //
//         //   Fluttertoast.showToast(msg: "total  sdfsdfs ${doctors.length}");
//         // Card(
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(20.0),
//         //       child: Text(
//         //         doctors[position].strCustomerName.toString(),
//         //         //position.toString(),
//         //         style: TextStyle(fontSize: 22.0),
//         //       ),
//         //     ),
//         //   );
//         },
//       ),
//     ],
//
//
//   );
// }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter SQLite Demo',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late Database _database;
//   List<Map<String, dynamic>> _notes = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _openDatabase();
//     _readNotes();
//   }
//
//   Future<void> _openDatabase() async {
//     String databasePath = await getDatabasesPath();
//     String filePath = join(databasePath, 'dbdeeplaid.db');
//
//     _database = await openDatabase(filePath, version: 1, onCreate: _onCreateDatabase);
//   }
//
//
//
//   Future<void> _readNotes() async {
//     _notes = await _database.query('notes');
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter SQLite Demo'),
//       ),
//       body: ListView.builder(
//         itemCount: _notes.length,
//         itemBuilder: (context, index) {
//           Map<String, dynamic> note = _notes[index];
//           return ListTile(
//             title: Text(note['title']),
//             subtitle: Text(note['content']),
//           );
//         },
//       ),
//     );
//   }
// }
