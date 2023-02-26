import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sync extends StatefulWidget {
  const Sync({Key? key}) : super(key: key);

  @override
  State<Sync> createState() => _SyncState();
}

class _SyncState extends State<Sync> {
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
                                child: Text(
                                  "Doctor Update",
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
