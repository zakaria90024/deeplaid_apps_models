import 'package:deeplaid_apps_models/custom_alart_dialog/alartdialog.dart';
import 'package:deeplaid_apps_models/model/commision_model.dart';
import 'package:deeplaid_apps_models/model/group_model.dart';
import 'package:deeplaid_apps_models/model/item_model.dart';
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
  //var _showAlertDialog;
  final TextEditingController _numberController = TextEditingController();
  late String userID = "85";
  late List<DoctorModel> _employees;
  late List<GroupModel> _groups;
  late List<ItemModel> _items;
  late List<CommissionSlabModel> _commissions;
  late DoctorModel ef;
  var dbHelper;

  @override
  void initState() {
    _employees = [];
    dbHelper = DBHelper();
    //_showAlertDialog = DialogCustomm();
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
                                    onTap: () {},
                                    child: Text(
                                      "Doctor Update",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    )),
                              ),
                            ),
                            SizedBox(
                                height: deviceHight * 0.30,
                                width: deviceWidth * 0.30,
                                child: GestureDetector(
                                  onTap: () {
                                    dbHelper.deleteDoctor();

                                    // dbHelper.save(DoctorModel(
                                    //
                                    //     mpo: "2",
                                    //     strCustomerName: "sdfsdf",
                                    //     straddress:"sdfsdf",
                                    //     strPhone:"sdfs"));

                                    //Services.getDoctor().then((value) => null);
                                    //insert into Doctor table
                                    Services.getDoctor().then((doctors) {
                                      setState(() {
                                        _employees = doctors;

                                        // Fluttertoast.showToast(
                                        //     msg: "total${_employees.length}");
                                        Fluttertoast.showToast(
                                            msg: "total${_employees.length}");
                                        dbHelper.sqfliteSaveDoctor(DoctorModel(
                                            mpo: "10",
                                            strCustomerName: "New Doctor",
                                            straddress: "",
                                            strPhone: ""));

                                        for (int i = 0;
                                            i < _employees.length;
                                            i++) {
                                          dbHelper.sqfliteSaveDoctor(
                                              DoctorModel(
                                                  mpo: userID,
                                                  strCustomerName: _employees[i]
                                                      .strCustomerName,
                                                  straddress:
                                                      _employees[i].straddress,
                                                  strPhone:
                                                      _employees[i].strPhone));

                                          // if (i == 0) {
                                          //   DoctorModel e = DoctorModel(
                                          //       mpo: userID,
                                          //       strCustomerName: "New Doctor",
                                          //       straddress:
                                          //           _employees[i].straddress,
                                          //       strPhone:
                                          //           _employees[i].strPhone);
                                          //   dbHelper.deleteDoctor();
                                          //   dbHelper.save(e);
                                          // } else {
                                          //   DoctorModel e = DoctorModel(
                                          //       mpo: "85",
                                          //       strCustomerName: _employees[i]
                                          //           .strCustomerName,
                                          //       straddress:
                                          //           _employees[i].straddress,
                                          //       strPhone:
                                          //           _employees[i].strPhone);
                                          //   dbHelper.save(e);
                                          //
                                          //   return;
                                          //   Fluttertoast.showToast(
                                          //       msg: "calldsets");
                                          // }
                                        }
                                      });

                                      DialogCustomm.showAlertDoneFail(context,
                                          "Done", "Insert Successful", "Okay");

                                      // DoctorModel e = DoctorModel("ds", "sdf", "sdfsd", name);
                                      // dbHelper.save(e);
                                    });

                                    //Navigator.push((context), MaterialPageRoute(builder: (context)=>DBTestPage(title: 'title',)));
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
                                    dbHelper.sqlitedeleteGroup();

                                    //insert Group
                                    Services.getGroup().then((groups) {
                                      setState(() {
                                        _groups = groups;

                                        Fluttertoast.showToast(
                                            msg: "total ${_groups.length}");

                                        for (int i = 0;
                                            i < _groups.length;
                                            i++) {
                                          dbHelper.sqflitesaveGroup(GroupModel(
                                            GroupName: _groups[i].GroupName,
                                          ));
                                        }
                                      });

                                      DialogCustomm.showAlertDoneFail(
                                          context,
                                          "Done",
                                          "Group Insert Successful",
                                          "Okay");

                                      // DoctorModel e = DoctorModel("ds", "sdf", "sdfsd", name);
                                      // dbHelper.save(e);
                                    });
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
                                    dbHelper.sqlitedeleteItem();

                                    //insert Group
                                    Services.getItem().then((Items) {
                                      setState(() {
                                        _items = Items;
                                        Fluttertoast.showToast(
                                            msg: "total${_items.length}");

                                        for (int i = 0;
                                            i < _items.length;
                                            i++) {
                                          dbHelper.sqfliteSaveItem(ItemModel(
                                              commgroupgame:
                                                  _items[i].commgroupgame,
                                              dblPartyvalue:
                                                  _items[i].dblPartyvalue,
                                              dblRate: _items[i].dblRate,
                                              dblcomboMaxvalue:
                                                  _items[i].dblcomboMaxvalue,
                                              dblcomboMinqty:
                                                  _items[i].dblcomboMinqty,
                                              groupName: _items[i].groupName,
                                              itemName: _items[i].itemName,
                                              itemcode: _items[i].itemcode,
                                              depot: _items[i].depot));
                                        }
                                        DialogCustomm.showAlertDoneFail(
                                            context,
                                            "Done",
                                            "Item Insert Successful",
                                            "Okay");
                                      });

                                      // DoctorModel e = DoctorModel("ds", "sdf", "sdfsd", name);
                                      // dbHelper.save(e);
                                    });
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
                                    //dbHelper.sqlitedeleteCommission();

                                    //insert Group
                                    Services.getCommission().then((Items) {
                                      setState(() {
                                        _commissions = Items;
                                        Fluttertoast.showToast(
                                            msg:
                                                "total ${_commissions.length}");

                                        for (int i = 0;
                                            i < _commissions.length;
                                            i++) {
                                          dbHelper.sqfliteSaveCommision(
                                              CommissionSlabModel(
                                            dblFromRange:
                                                _commissions[i].dblFromRange,
                                            dblPercentage:
                                                _commissions[i].dblPercentage,
                                            dblToRange:
                                                _commissions[i].dblToRange,
                                            groupName:
                                                _commissions[i].groupName,
                                            strDate: _commissions[i].strDate,
                                          ));
                                        }
                                        DialogCustomm.showAlertDoneFail(
                                            context,
                                            "Done",
                                            "Commission Insert Successful",
                                            "Okay");
                                      });

                                      // DoctorModel e = DoctorModel("ds", "sdf", "sdfsd", name);
                                      // dbHelper.save(e);
                                    });
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
