import 'dart:developer';

import 'package:deeplaid_apps_models/service/Services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../login_deeplaid_apps/login.dart';

class otpModel extends StatefulWidget {
  const otpModel({Key? key, required String title}) : super(key: key);

  @override
  State<otpModel> createState() => _otpModelState();
}

class _otpModelState extends State<otpModel> {
  late String otpUser = Services.getValidNumber("01818280008") as String;
  final TextEditingController _numberController = TextEditingController();
  late String userID;

  @override
  void initState() {
    super.initState();
  }

  _createTable() {
    //Services.getValidNumber(_numberController.text);
    Services.getValidNumber(_numberController.text).then((result) {
      userID = result;
      //print("from name $userID");
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
                                      var _number = _numberController.text;

                                      _createTable();


                                      print("Print before$userID");

                                      var fd = "353";
                                      var s = userID;

                                      if (s == fd) {

                                        print("if called $userID");

                                      } else {
                                        print("else called$userID");
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //         const Login(
                                        //           title: "_number",
                                        //         )));
                                        _numberController.clear();

                                      }
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
