import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/doctor_model.dart';
import '../service/Services.dart';
import '../sqlite_crud.dart';
import '../sqlitehelper_deeplaid_apps/sqlitehelper.dart';

class Sync extends StatefulWidget {
  const Sync({Key? key}) : super(key: key);

  @override
  State<Sync> createState() => _SyncState();
}

class _SyncState extends State<Sync> {
  final TextEditingController _numberController = TextEditingController();
  late String userID = "85";
  late List<DoctorModel> _employees;
  var dbHelper;

  @override
  void initState() {
    _employees = [];
    dbHelper = DBHelper();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //
    // AlertDialog alert = AlertDialog(
    //   title: Text("AlertDialog Title"),
    //   content: Text("AlertDialog description goes here."),
    //   actions: [
    //     TextButton(
    //       child: Text("Close"),
    //       onPressed: () {
    //         Navigator.of(context).pop();
    //       },
    //     ),
    //   ],
    // );
    //
    // // show the dialog
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return alert;
    //   },
    // );
    // setState(() {
    //
    // });


    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    print("height$deviceHight width$deviceWidth");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Synchronize",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: deviceHight * 0.10,
              width: deviceWidth * 0.98,
              child: Card(
                color: Colors.blue[50],
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: deviceHight * 0.10,
                        width: deviceWidth * 0.95,
                        child: Row(
                          children: [

                            SizedBox(
                              height: deviceHight * 0.30,
                              width: deviceWidth * 0.65,
                              child: Center(
                                child: GestureDetector(
                                  onTap: (){

                                  },
                                  child:Text(
                                    "Doctor Update",
                                    style:
                                    TextStyle(fontWeight: FontWeight.normal),
                                  )
                                ),
                              ),
                            ),
                            SizedBox(
                                height: deviceHight * 0.30,
                                width: deviceWidth * 0.30,
                                child: GestureDetector(
                                  onTap: () {


                                    //insert into Doctor table
                                    Services.getDoctor().then((doctors) {
                                      setState(() {
                                        _employees = doctors;

                                        for (int i = 0; i < _employees.length; i++) {
                                          if (_employees.length == 0) {
                                            if (i == 0) {
                                              DoctorModel e = DoctorModel(
                                                  mpo: userID,
                                                  strCustomerName: "New Doctor",
                                                  straddress: _employees[i].straddress,
                                                  strPhone: _employees[i].strPhone);
                                              dbHelper.save(e);
                                            }
                                          }

                                          DoctorModel e = DoctorModel(
                                              mpo: userID,
                                              strCustomerName: _employees[i].strCustomerName,
                                              straddress: _employees[i].straddress,
                                              strPhone: _employees[i].strPhone);
                                          dbHelper.save(e);
                                        }
                                      });

                                      // DoctorModel e = DoctorModel("ds", "sdf", "sdfsd", name);
                                      // dbHelper.save(e);

                                      print("Length: ${_employees[0].strCustomerName}");
                                    });

                                    //Navigator.push((context), MaterialPageRoute(builder: (context)=>DBTestPage(title: 'title',)));
                                    Fluttertoast.showToast(msg: "Doctor Sync Succcessfull");

                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 0,
                                    color: Colors.blue,
                                    child: Container(
                                      height: 40,
                                      width: 70,
                                      child: Center(
                                          child: Text(
                                        "SYNC",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      )),
                                    ),
                                  ),
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: deviceHight * 0.10,
              width: deviceWidth * 0.98,
              child: Card(
                color: Colors.blue[50],
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: deviceHight * 0.10,
                        width: deviceWidth * 0.95,
                        child: Row(
                          children: [
                            SizedBox(
                              height: deviceHight * 0.30,
                              width: deviceWidth * 0.65,
                              child: Center(
                                child: Text(
                                  "Group Update",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: deviceHight * 0.30,
                                width: deviceWidth * 0.30,
                                child: GestureDetector(
                                  onTap: () {
                                    print("Clicked Doctor Sync");
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 0,
                                    color: Colors.blue,
                                    child: Container(
                                      height: 40,
                                      width: 70,
                                      child: Center(
                                          child: Text(
                                        "SYNC",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      )),
                                    ),
                                  ),
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: deviceHight * 0.10,
              width: deviceWidth * 0.98,
              child: Card(
                color: Colors.blue[50],
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: deviceHight * 0.10,
                        width: deviceWidth * 0.95,
                        child: Row(
                          children: [
                            SizedBox(
                              height: deviceHight * 0.30,
                              width: deviceWidth * 0.65,
                              child: Center(
                                child: Text(
                                  "Item Update",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: deviceHight * 0.30,
                                width: deviceWidth * 0.30,
                                child: GestureDetector(
                                  onTap: () {
                                    print("Clicked Doctor Sync");
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 0,
                                    color: Colors.blue,
                                    child: Container(
                                      height: 40,
                                      width: 70,
                                      child: Center(
                                          child: Text(
                                        "SYNC",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      )),
                                    ),
                                  ),
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: deviceHight * 0.10,
              width: deviceWidth * 0.98,
              child: Card(
                color: Colors.blue[50],
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: deviceHight * 0.10,
                        width: deviceWidth * 0.95,
                        child: Row(
                          children: [
                            SizedBox(
                              height: deviceHight * 0.30,
                              width: deviceWidth * 0.65,
                              child: Center(
                                child: Text(
                                  "Commission Update",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: deviceHight * 0.30,
                                width: deviceWidth * 0.30,
                                child: GestureDetector(
                                  onTap: () {
                                    print("Clicked Doctor Sync");
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 0,
                                    color: Colors.blue,
                                    child: Container(
                                      height: 40,
                                      width: 70,
                                      child: Center(
                                          child: Text(
                                        "SYNC",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      )),
                                    ),
                                  ),
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: deviceHight * 0.10,
              width: deviceWidth * 0.98,
              child: Card(
                color: Colors.blue[50],
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: deviceHight * 0.10,
                        width: deviceWidth * 0.95,
                        child: Row(
                          children: [
                            SizedBox(
                              height: deviceHight * 0.30,
                              width: deviceWidth * 0.65,
                              child: Center(
                                child: Text(
                                  "Mpo Update",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: deviceHight * 0.30,
                                width: deviceWidth * 0.30,
                                child: GestureDetector(
                                  onTap: () {
                                    print("Clicked Doctor Sync");
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 0,
                                    color: Colors.blue,
                                    child: Container(
                                      height: 40,
                                      width: 70,
                                      child: Center(
                                          child: Text(
                                        "SYNC",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      )),
                                    ),
                                  ),
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
