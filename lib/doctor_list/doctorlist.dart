import 'package:deeplaid_apps_models/service/Services.dart';
import 'package:deeplaid_apps_models/sqlitehelper_deeplaid_apps/sqlitehelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/doctor_model.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  late Future<List<DoctorModel>> doctors;
  var dbHelper;

  @override
  void initState() {
    dbHelper = DBHelper();
    doctors = dbHelper.getDoctors();

    refreshDRList();
    super.initState();
  }

  refreshDRList() {
    setState(() {

      doctors = dbHelper.getDoctors();
      print("doctor$doctors");

    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 16,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Doctor List",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              listDoctor(),
              // SizedBox(
              //   height: deviceHight - 90,
              //   width: deviceWidth - 12,

                // child: ListView.builder(
                //   itemCount: doctors,
                //   itemBuilder: (context, position) {
                //     Fluttertoast.showToast(msg: "total ${doctors.length}");
                //     return Card(
                //       child: Padding(
                //         padding: const EdgeInsets.all(20.0),
                //         child: Text(
                //           doctors[position].toString(),
                //           //position.toString(),
                //           style: TextStyle(fontSize: 22.0),
                //         ),
                //       ),
                //     );
                //   },
                // ),
             // )
            ],
          ),
        ),
      ),
    );
  }

  listDoctor() {
    return Expanded(
      child: FutureBuilder(
        future: doctors,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTablee(snapshot.data as List<DoctorModel>);
          }

          if (null == snapshot.data) {
            return const Text("No Data Found");
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }

  SingleChildScrollView dataTablee (List<DoctorModel> doctors){
    Fluttertoast.showToast(msg: "${doctors[1].strCustomerName}");
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, position) {

            Fluttertoast.showToast(msg: "total  sdfsdfs ${doctors.length}");
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  doctors[position].toString(),
                  //position.toString(),
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            );
          },
        ),
    );
  }
}
