import 'dart:developer';

import 'package:deeplaid_apps_models/model/doctor_model.dart';
import 'package:deeplaid_apps_models/service/Services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../login_deeplaid_apps/login.dart';
import '../sqlitehelper_deeplaid_apps/sqlitehelper.dart';

class otpModel extends StatefulWidget {
  const otpModel({Key? key, required String title}) : super(key: key);

  @override
  State<otpModel> createState() => _otpModelState();
}

class _otpModelState extends State<otpModel> {
  //late String otpUser = Services.getValidNumber("01818280008") as String;
  final TextEditingController _numberController = TextEditingController();
  late String userID = "";
  late List<DoctorModel> _employees;
  var dbHelper;

  @override
  void initState() {
    _employees = [];
    dbHelper = DBHelper();
    super.initState();
  }

  _createTable() {
    // Services.getValidNumber(_numberController.text).then((result) {
    //   final String jsonData = jsonDecode(result);
    //   final String dataMapList = jsonData.toString();
    //   userID = dataMapList;
    //   if (userID.isNotEmpty) {
    //     print("else if called $userID");
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => const Login(
    //                   title: "_number",
    //                 )));
    //
    //     _numberController.clear();
    //     userID = "";
    //   } else if (userID.isEmpty) {
    //     Fluttertoast.showToast(msg: "Invalid Mobile Number");
    //   }
    // });

    // Services.getDoctor().then((value) {
    //   print("Value is = $value");
    //
    //   //List<DoctorModel> dr = value.cast<DoctorModel>();
    //   //Future<List<Map<String, dynamic>>> sdf = value as Future<List<Map<String, dynamic>>>;
    //   //print("hellot = $dr");
    //
    // });

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

    // Services.addEmployee(_firstNameController.text, _lastNameController.text)
    //     .then((result) {
    //   if ('success' == result) {
    //     _getEmployees();
    //   }
    //   _clearValues();
    // });

    //rint("responsdfsd$response");
  }

  _getEmployees() {}

  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: deviceHight,
              width: deviceWidth,
              child: SizedBox(
                height: deviceHight * 0.50,
                child: Column(
                  children: [
                    Opacity(
                      opacity: 0,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset('assets/images/logo.png'),
                            ),
                          ),
                          Column(
                            children: const [
                              Text(
                                "ভেরিফিকেশন কোড",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 30, right: 30, top: 8),
                            child: TextField(
                              textAlign: TextAlign.center,
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                                hintText: 'এখানে কোড দিন',
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 16.0),
                                //labelText: 'Enter OTP Code',
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                primary: Colors.grey,
                                elevation: 0,
                              ),
                              child: const SizedBox(
                                height: 20,
                                width: 280,
                                child: Center(
                                    child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                              )),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: deviceHight * 0.50,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 80,
                                    child:
                                        Image.asset('assets/images/logo.png'),
                                  ),
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      "রেজিস্টার্ড মোবাইল নাম্বার দিয়ে লগ ইন করুন",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30, top: 16),
                                  child: TextField(
                                    controller: _numberController,
                                    textAlign: TextAlign.center,
                                    maxLength: 11,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black),
                                      ),
                                      hintText: '017XXXXXXXX',
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 16.0),
                                      //labelText: 'Enter OTP Code',
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      if (_numberController.text
                                          .trim()
                                          .isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "Number Field Empty",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.TOP,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.blue,
                                            textColor: Colors.white,
                                            fontSize: 12.0);
                                      } else {
                                        _createTable();
                                      }

                                      // if (s == userID) {
                                      //
                                      //
                                      //
                                      // } else if(s == "393") {
                                      //   print("else called$userID");
                                      //
                                      //
                                      // }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      primary: Colors.grey,
                                      elevation: 0,
                                    ),
                                    child: const SizedBox(
                                      height: 20,
                                      width: 280,
                                      child: Center(
                                          child: Text(
                                        "পরবর্তী",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
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
