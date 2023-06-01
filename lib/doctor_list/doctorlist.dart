import 'package:deeplaid_apps_models/service/Services.dart';
import 'package:deeplaid_apps_models/sqlitehelper_deeplaid_apps/sqlitehelper.dart';
import 'package:flutter/material.dart';

import '../model/doctor_model.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  late List<DoctorModel> doctors;
  var dbHelper;


  @override
  void initState() {
    doctors = [];
    dbHelper = DBHelper();
    doctors = dbHelper.getDoctors();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 16,),
        onPressed: () => Navigator.of(context).pop(),
      ),title: const Text("Doctor List", style: TextStyle(color: Colors.white, fontSize: 17 ),),),
      body:Center(
        child: Column(
          children: [
            SizedBox(
              height: deviceHight-90,
              width: deviceWidth-12,
              child:
              ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, position) {
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
            )
          ],
        ),
      ),
    );
  }


}
