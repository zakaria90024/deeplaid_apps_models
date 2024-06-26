import 'dart:convert';

import 'package:deeplaid_apps_models/dashboard_deeplaid_apps/home.dart';
import 'package:deeplaid_apps_models/model/login_model.dart';
import 'package:deeplaid_apps_models/sqlitehelper_deeplaid_apps/sqlitehelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service/Services.dart';

class Login extends StatefulWidget {
  final String userid;

  const Login({Key? key, required String title, required this.userid})
      : super(key: key);


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  List<Company> _companies = Company.getCompanies();
  late List<DropdownMenuItem<Company>> _dropdownMenuItems;
  late List<LoginModel> loginList;
  String dropdownValue = 'Select Branch';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var dbHelper = DBHelper();

  @override
  void initState() {
    _emailController.value = TextEditingValue(text: widget.userid);
    super.initState();
    passwordVisible = true;
    //_getloginTable();

  }

  _getloginTable( String username, password, branchid) {

    Services.getValidLogin(username, password, branchid).then((value) {
      String? TeritorryName = value.strTeritorryName;
      String? LedgerName = value.strLedgerName;
      String? response = value.strResponse;
      String? strPassword = value.strUserPassword;
      String? intMpoType = value.intMpoType;
      String? strMobileNo = value.strMobileNo;
      String? strTeritorryCode = value.strTeritorryCode;
      String? strTeritorryName = value.strTeritorryName;
      String? strUserID = value.strUserID;
      String? strUserPassword = value.strUserPassword;
      String? strRole = value.strRole;
      String? strTeamZone = value.strTeamZone;
      String? strbranchID = value.strbranchID;
      String? strMerzeName = value.strMerzeName;

      String? yes = "Yes";
      if(response == yes){
        Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (context) =>
                     HomePage(title: "" , fullName: "$strPassword: $LedgerName , $TeritorryName")));

        dbHelper.loginUserDelete();
        dbHelper.loginInfoSave(LoginModel(intMpoType: intMpoType, strLedgerName: LedgerName, strMobileNo: strMobileNo, strResponse: yes, strTeritorryCode: strTeritorryCode, strTeritorryName: strTeritorryName, strUserID: strUserID, strUserPassword: strUserPassword, strRole: strRole, strTeamZone: strTeamZone, strbranchID: strbranchID, strMerzeName: strMerzeName));

      }else{
        Fluttertoast.showToast(msg: "Userid/Password/Branch Incorrect");
      }
    });

    // Services.getDoctor().then((value) {
    //   print("Value is = $value");
    //
    //   //List<DoctorModel> dr = value.cast<DoctorModel>();
    //   //Future<List<Map<String, dynamic>>> sdf = value as Future<List<Map<String, dynamic>>>;
    //   //print("hellot = $dr");
    //
    // });

    // Services.addEmployee(_firstNameController.text, _lastNameController.text)
    //     .then((result) {
    //   if ('success' == result) {
    //     _getEmployees();
    //   }
    //   _clearValues();
    // });

    //rint("responsdfsd$response");
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = [];
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    String? userID = widget.userid;
    //Fluttertoast.showToast(msg: widget.userid);
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
            msg: "Please Login",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 12.0);
        return true; // Return true to allow the back navigation, false to prevent it.
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset(Image.asset("assets/images/bgfull.png")),
              SizedBox(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bgfull.png"),
                          fit: BoxFit.cover)),
                  height: deviceHight,
                  width: deviceWidth,
                  //color: Colors.red,
                  // decoration: const BoxDecoration(
                  //   gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [Colors.blue, Colors.white],
                  //   ),
                  // ),

                  //color: Colors.blue,
                  child: Column(
                    children: [
                      //Image.asset("assets/images/bgfull.png"),
                      SizedBox(
                        height: deviceHight * 0.25,
                        width: deviceWidth,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 15.0),

                          height: deviceHight * 0.10,
                          width: deviceWidth,
                          //child: Image.asset('assets/images/logo.png'),
                          child: SizedBox(
                            height: deviceHight * 0.30,
                            width: deviceWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: SizedBox(
                                    height: 75,
                                    width: 75,
                                    child:
                                        Image.asset('assets/images/logo.png'),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Deeplaid",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " Laboratories Limited",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: "Schuyler"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: deviceHight * 0.10,
                        //   child: SizedBox(
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Padding(
                        //             padding: const EdgeInsets.only(top: 15.0),
                        //             child: Text("dlfsdkfj")
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ) ,
                      ),

                      SizedBox(
                        height: deviceHight * 0.50,
                        width: deviceWidth,
                        child: Container(
                          child: Column(
                            children: [
                              // Card(
                              //   child: InkWell(
                              //     splashColor: Colors.blue,
                              //     onTap: () {},
                              //     child: const SizedBox(
                              //       height: 250,
                              //       width: 350,
                              //       child: Text("IM CARD for "),
                              //     ),
                              //   ),
                              //   color: Colors.white,
                              //   clipBehavior: Clip.hardEdge,
                              // ),
                              Card(
                                elevation: 3,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: SizedBox(
                                  width: 350,
                                  height: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22, right: 22, top: 12),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            String url = 'https://google.com';
                                            launch(url);
                                          },
                                          child: const Text(
                                            "WEB PORTAL",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),

                                        TextField(
                                          controller: _emailController,
                                          maxLength: 6,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            labelText: "User ID",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                          width: 16,
                                        ),
                                        TextField(
                                          controller: _passwordController,
                                          obscureText: passwordVisible,
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const UnderlineInputBorder(),
                                            labelText: "Password",
                                            //helperText: "Password must contain special character",
                                            helperStyle: const TextStyle(
                                                color: Colors.green),
                                            suffixIcon: IconButton(
                                              icon: Icon(passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    passwordVisible =
                                                        !passwordVisible;
                                                  },
                                                );
                                              },
                                            ),
                                            alignLabelWithHint: false,
                                            filled: false,
                                          ),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          textInputAction: TextInputAction.done,
                                        ),
                                        Row(
                                          children: [
                                            DropdownButton<String>(
                                              underline: Container(),
                                              // Step 3.
                                              value: dropdownValue,
                                              // Step 4.
                                              items: <String>[
                                                'Select Branch',
                                                '0001-Homeo',
                                                '0003-Harbal'
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: const TextStyle(
                                                        fontSize: 15),
                                                  ),
                                                );
                                              }).toList(),
                                              // Step 5.
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownValue = newValue!;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        // const Text(
                                        //   //'Selected: $dropdownValue',
                                        //   "",
                                        //   style: TextStyle(
                                        //       fontSize: 12,
                                        //       fontWeight: FontWeight.bold),
                                        // ),
                                        ElevatedButton(
                                            onPressed: () {
                                              var emailText =
                                                  _emailController.text;
                                              var passwordText =
                                                  _passwordController.text;

                                              String string = dropdownValue;
                                              List<String> splitStrings = string.split("-");

                                              _getloginTable(emailText, passwordText, splitStrings[0]);
                                              // Fluttertoast.showToast(
                                              //     msg:
                                              //         "User id = $emailText\n Password = $passwordText\n Selected = $dropdownValue",
                                              //     toastLength:
                                              //         Toast.LENGTH_SHORT,
                                              //     gravity: ToastGravity.BOTTOM,
                                              //     timeInSecForIosWeb: 1,
                                              //     backgroundColor: Colors.green,
                                              //     textColor: Colors.black,
                                              //     fontSize: 12.0);
                                              // Navigator.push(
                                              //     (context),
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             HomePage("gome")));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              primary: Colors.grey,
                                              elevation: 0,
                                            ),
                                            child: const SizedBox(
                                              height: 25,
                                              width: 280,
                                              child: Center(
                                                  child: Text(
                                                "Login",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const [
                      //         Text(
                      //           "Deeplaid",
                      //           style: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 18,
                      //               fontStyle: FontStyle.normal),
                      //         ),
                      //         Text(
                      //           " Laboratories Limited",
                      //           style: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 18,
                      //               fontStyle: FontStyle.italic,
                      //               fontWeight: FontWeight.bold),
                      //         )
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              )

              // SizedBox(
              //   height: 200,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

//class for login user dropdown

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Apple'),
      Company(2, 'Google'),
      Company(3, 'Samsung'),
      Company(4, 'Sony'),
      Company(5, 'LG'),
    ];
  }
}
