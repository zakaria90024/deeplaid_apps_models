import 'package:deeplaid_apps_models/sync_deeplaid_apps/sync.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io' show Platform;

class HomePage extends StatefulWidget {
  const HomePage(String s, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    print("height$deviceHight width$deviceWidth");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(children: [
          SizedBox(
              child: Container(
                  // decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage("assets/images/bg.png"),
                  //         fit: BoxFit.cover)),
                  // height: deviceHight,
                  // width: deviceWidth,
                  child: Column(children: [
            SizedBox(
              height: deviceHight * 0.10,
              width: deviceWidth,
              child: SizedBox(
                child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 28, bottom: 2),
                    child: Row(
                      children: [
                        SizedBox(
                          width: deviceWidth * 0.80,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25,top: 0, right: 0, bottom: 0),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            print("clicked Logo");
                                          },
                                          child: Image.asset(
                                            'assets/images/logo.png',
                                            height: 35,
                                            width: 35,
                                          ),
                                        ),

                                        // IconButton(
                                        //
                                        //   onPressed: () {
                                        //     bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
                                        //     if(isIOS){
                                        //
                                        //     }
                                        //
                                        //
                                        //   },
                                        //   icon: const Icon(Icons.more_vert),
                                        // ),
                                      ],
                                    ),
                                  ),

                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  //   children: [
                                  //
                                  //     Row(
                                  //       mainAxisAlignment:MainAxisAlignment.start,
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: (){
                                  //             print("clicked Logo");
                                  //           },
                                  //           child: Image.asset('assets/images/logo.png', height: 38,width: 38,),
                                  //         ),
                                  //
                                  //         // IconButton(
                                  //         //
                                  //         //   onPressed: () {
                                  //         //     bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
                                  //         //     if(isIOS){
                                  //         //
                                  //         //     }
                                  //         //
                                  //         //
                                  //         //   },
                                  //         //   icon: const Icon(Icons.more_vert),
                                  //         // ),
                                  //       ],
                                  //     ),
                                  //
                                  //     // Column(
                                  //     //   children: [
                                  //     //     Row(
                                  //     //       mainAxisAlignment: MainAxisAlignment.end,
                                  //     //       children: [
                                  //     //         Icon(Icons.more_vert)
                                  //     //       ],
                                  //     //     ),
                                  //     //   ],
                                  //     // )
                                  //
                                  //   ],
                                  // ),

                                  // Column(
                                  //   children: [
                                  //     Row(
                                  //       mainAxisAlignment: MainAxisAlignment.end,
                                  //       children: [
                                  //         Icon(Icons.more_vert)
                                  //       ],
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: deviceWidth * 0.10,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            print("clicked Logo");
                                          },
                                          child: Icon(Icons.mail, color: Colors.white, size: 26,)
                                      ),

                                      // IconButton(
                                      //
                                      //   onPressed: () {
                                      //     bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
                                      //     if(isIOS){
                                      //
                                      //     }
                                      //
                                      //
                                      //   },
                                      //   icon: const Icon(Icons.more_vert),
                                      // ),
                                    ],
                                  ),

                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  //   children: [
                                  //
                                  //     Row(
                                  //       mainAxisAlignment:MainAxisAlignment.start,
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: (){
                                  //             print("clicked Logo");
                                  //           },
                                  //           child: Image.asset('assets/images/logo.png', height: 38,width: 38,),
                                  //         ),
                                  //
                                  //         // IconButton(
                                  //         //
                                  //         //   onPressed: () {
                                  //         //     bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
                                  //         //     if(isIOS){
                                  //         //
                                  //         //     }
                                  //         //
                                  //         //
                                  //         //   },
                                  //         //   icon: const Icon(Icons.more_vert),
                                  //         // ),
                                  //       ],
                                  //     ),
                                  //
                                  //     // Column(
                                  //     //   children: [
                                  //     //     Row(
                                  //     //       mainAxisAlignment: MainAxisAlignment.end,
                                  //     //       children: [
                                  //     //         Icon(Icons.more_vert)
                                  //     //       ],
                                  //     //     ),
                                  //     //   ],
                                  //     // )
                                  //
                                  //   ],
                                  // ),

                                  // Column(
                                  //   children: [
                                  //     Row(
                                  //       mainAxisAlignment: MainAxisAlignment.end,
                                  //       children: [
                                  //         Icon(Icons.more_vert)
                                  //       ],
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: deviceWidth * 0.10,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            print("clicked Logo");
                                          },
                                          child: const Icon(CupertinoIcons.person_alt_circle_fill, color: Colors.white, size: 26,)
                                      ),

                                      // IconButton(
                                      //
                                      //   onPressed: () {
                                      //     bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
                                      //     if(isIOS){
                                      //
                                      //     }
                                      //
                                      //
                                      //   },
                                      //   icon: const Icon(Icons.more_vert),
                                      // ),
                                    ],
                                  ),

                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  //   children: [
                                  //
                                  //     Row(
                                  //       mainAxisAlignment:MainAxisAlignment.start,
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: (){
                                  //             print("clicked Logo");
                                  //           },
                                  //           child: Image.asset('assets/images/logo.png', height: 38,width: 38,),
                                  //         ),
                                  //
                                  //         // IconButton(
                                  //         //
                                  //         //   onPressed: () {
                                  //         //     bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
                                  //         //     if(isIOS){
                                  //         //
                                  //         //     }
                                  //         //
                                  //         //
                                  //         //   },
                                  //         //   icon: const Icon(Icons.more_vert),
                                  //         // ),
                                  //       ],
                                  //     ),
                                  //
                                  //     // Column(
                                  //     //   children: [
                                  //     //     Row(
                                  //     //       mainAxisAlignment: MainAxisAlignment.end,
                                  //     //       children: [
                                  //     //         Icon(Icons.more_vert)
                                  //     //       ],
                                  //     //     ),
                                  //     //   ],
                                  //     // )
                                  //
                                  //   ],
                                  // ),

                                  // Column(
                                  //   children: [
                                  //     Row(
                                  //       mainAxisAlignment: MainAxisAlignment.end,
                                  //       children: [
                                  //         Icon(Icons.more_vert)
                                  //       ],
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),

                        //Text("Dashboard", style: TextStyle(fontSize: 20, color: Colors.white),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print("clicked1");
                  },
                  child: SizedBox(
                    height: deviceHight * 0.15,
                    width: deviceWidth,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 24, top: 0, right: 0, bottom: 5),
                          child: Icon(
                            CupertinoIcons.person_alt_circle,
                            color: Colors.black,
                            size: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 25, right: 4, bottom: 4),
                          child: Column(
                            children: const [
                              Text(
                                "Name: MPO-Jamal Uddin-Jamalpur",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "Date: 20.12.1998",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "Version: 22.68",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHight * 0.15,
                  width: deviceWidth * 0.0,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          CupertinoIcons.home,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text(
                          "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new GestureDetector(
                  onTap: () {
                    print("clicked");
                  },
                  child: SizedBox(
                    height: deviceHight * 0.15,
                    width: deviceWidth * 0.45,
                    child: Card(
                      elevation: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.tv_music_note,
                            color: Colors.black,
                            size: 50,
                          ),
                          Text(
                            "Create Order",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHight * 0.15,
                  width: deviceWidth * 0.45,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.square_list,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text(
                          "Doctor List",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: deviceHight * 0.15,
                  width: deviceWidth * 0.45,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.square_list,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text(
                          "Order List",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHight * 0.15,
                  width: deviceWidth * 0.45,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.doc,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text(
                          "Draft",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: deviceHight * 0.15,
                  width: deviceWidth * 0.45,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.mail,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text(
                          "Study Matrial",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHight * 0.15,
                  width: deviceWidth * 0.45,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.slider_horizontal_below_rectangle,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text(
                          "Show Card",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                GestureDetector(
                  onTap: () {
                    Navigator.push((context), MaterialPageRoute(builder: (context)=>Sync()));
                  },
                child:SizedBox(
                  height: deviceHight * 0.15,
                  width: deviceWidth * 0.45,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.rays,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text(
                          "Sync",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),),

                SizedBox(
                  height: deviceHight * 0.15,
                  width: deviceWidth * 0.45,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.loop,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ])))
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
