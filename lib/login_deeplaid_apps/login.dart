import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required String title}) : super(key: key);
  final String title = "DropDown Demo";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  List<Company> _companies = Company.getCompanies();
  late List<DropdownMenuItem<Company>> _dropdownMenuItems;
  String dropdownValue = 'Select Branch';

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
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
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                                  child: Image.asset('assets/images/logo.png'),
                                  height: 75,
                                  width: 75,
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
                                      left: 20, right: 20, top: 12),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "WEB PORTAL",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      const TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.black),
                                          ),
                                          labelText: 'User ID',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 17,
                                        width: 17,
                                      ),
                                      TextField(
                                        obscureText: passwordVisible,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(),
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
                                                  style: TextStyle(fontSize: 15),
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
                                            Fluttertoast.showToast(
                                                msg: "Clicked Login",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.green,
                                                textColor: Colors.black,
                                                fontSize: 12.0);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey,
                                            elevation: 0,
                                          ),
                                          child: const SizedBox(
                                            height: 30,
                                            width:  270,
                                            child: Center(child: Text("Login")),
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
