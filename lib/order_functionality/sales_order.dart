import 'package:deeplaid_apps_models/model/group_model.dart';
import 'package:deeplaid_apps_models/model/item_model.dart';
import 'package:deeplaid_apps_models/order_functionality/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:searchfield/searchfield.dart';
import '../main.dart';
import '../model/customar_model.dart';
import '../sqlitehelper_deeplaid_apps/sqlitehelper.dart';

class SalesOrder extends StatefulWidget {
  const SalesOrder({super.key});

  @override
  State<SalesOrder> createState() => _SalesOrderState();
}

class _SalesOrderState extends State<SalesOrder> {
  late var totalAmount = "0.0";
  late var tc = "085";
  var dbHelper = DBHelper();
  late List<dynamic> doctors;
  late List<String> suggestons;

  List<String> suggestions = [];
  static late List<Customar> _userOptions = [];
  static late List<GroupModel> _userGroup = [];
  static late List<ItemModel> _userProducets = [];
  static late List<ItemModel> _userProducetsGroupWise = [];

  static String?  selectedDoctor = "";

  @override
  void initState() {
    if (_userOptions.isEmpty) {
      getCustomars();
    }

    if (_userGroup.isEmpty) {
      getGroups();
    }

    if (_userProducets.isEmpty) {
      getProducts();
    }
  }

  Future<void> getProducts() async {
    List<ItemModel> employees = await dbHelper.getProducts();

    for (int a = 0; a < employees.length; a++) {
      _userProducets.add(
        ItemModel(
          commgroupgame: employees[a].commgroupgame,
          dblPartyvalue: employees[a].dblPartyvalue,
          dblRate: employees[a].dblRate,
          dblcomboMaxvalue: employees[a].dblcomboMaxvalue,
          dblcomboMinqty: employees[a].dblcomboMinqty,
          groupName: employees[a].groupName,
          itemName: employees[a].itemName,
          itemcode: employees[a].itemcode,
          depot: employees[a].depot,
        ),
      );
    }
  }

  Future<void> getCustomars() async {
    List<Customar> employees = await dbHelper.getDoctorOrParty();

    for (int a = 0; a < employees.length; a++) {
      _userOptions.add(Customar(
          doctorName: employees[a].doctorName,
          doctorPhone: employees[a].doctorPhone));
    }
  }

  Future<void> getGroups() async {
    List<GroupModel> employees = await dbHelper.getGroups();
    for (int a = 0; a < employees.length; a++) {
      _userGroup.add(GroupModel(GroupName: employees[a].GroupName));
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: deviceHight * 0.10,
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "TC: $tc  ",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Total Amount: $totalAmount/-",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: deviceHight * 0.08,
                width: deviceWidth,
                child: Row(
                  children: [
                    Text(
                      "Customar: ★  ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: deviceHight * 0.70,
                      width: deviceWidth * 0.7,
                      child: CustomarAComplate(),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: deviceHight * 0.08,
                width: deviceWidth,
                child: Row(
                  children: [
                    Text(
                      "Group:        ★ ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: deviceHight * 0.70,
                      width: deviceWidth * 0.7,
                      child: GroupAComplate(),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: deviceHight * 0.08,
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Items Details",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),


              SizedBox(
                height: deviceHight * 0.08,
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Group",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Item",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Qty",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),

                    Text(
                      "Sub-Total",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),

                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),


              // SizedBox(
              //   height: deviceHight * 0.08,
              //   width: deviceWidth,
              //   child: Row(
              //     children: [
              //       Text(
              //         "Item:        ★ ",
              //         style: TextStyle(
              //             fontSize: 14,
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       SizedBox(
              //         height: deviceHight * 0.70,
              //         width: deviceWidth * 0.7,
              //         // child: ItemAComplate(),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

//for Customer Autocomplete=====================================================
class CustomarAComplate extends StatelessWidget {
  const CustomarAComplate({super.key});


  @override
  Widget build(BuildContext context) {
    return SearchField<Customar>(
      suggestions: _SalesOrderState._userOptions
          .map((e) => SearchFieldListItem<Customar>(
                e.doctorName,
                item: e,

                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Text(
                          e.doctorName,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),

                // child: Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       // CircleAvatar(
                //       //   backgroundImage: NetworkImage(e.doctorName),
                //       // ),
                //       SizedBox(width: 3),
                //       Text(e.doctorName),
                //     ],
                //   ),
                // ),
              ))
          .toList(),
      suggestionState: Suggestion.expand,
      onSuggestionTap: (SearchFieldListItem<Customar> item) {
        //_SalesOrderState().dbHelper.getGroups();
        GroupAComplate();
        Doctor.selectedDoctor = item.item?.doctorName;


        // Fluttertoast.showToast(
        //   msg: 'Your Customer  ${selectedDoctor}',
        // );
      },
    );
  }
}

//for Group Autocomplete=====================================================
class GroupAComplate extends StatelessWidget {
  const GroupAComplate({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchField<GroupModel>(
      suggestions: _SalesOrderState._userGroup
          .map((e) => SearchFieldListItem<GroupModel>(
                e.GroupName,
                item: e,

                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Text(
                          e.GroupName,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),

                // child: Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       // CircleAvatar(
                //       //   backgroundImage: NetworkImage(e.doctorName),
                //       // ),
                //       SizedBox(width: 3),
                //       Text(e.doctorName),
                //     ],
                //   ),
                // ),
              ))
          .toList(),
      suggestionState: Suggestion.expand,
      onSuggestionTap: (SearchFieldListItem<GroupModel> item) {



        Doctor.selectedGroup = item.item?.GroupName;

        //ItemAComplate();

        // Fluttertoast.showToast(msg: ""+this.);

        // Fluttertoast.showToast(
        //   msg: 'Your Group ${item.item?.GroupName}',
        // );


        _SalesOrderState._userProducetsGroupWise.clear();

        for (int a = 0; a < _SalesOrderState._userProducets.length; a++) {
          if (_SalesOrderState._userProducets[a].groupName ==
              item.item?.GroupName) {
            _SalesOrderState._userProducetsGroupWise.add(_SalesOrderState._userProducets[a]);
          }
        }

        showCustomDialog(context, _SalesOrderState._userProducetsGroupWise);
      },
    );
  }
}

//for Item Autocomplete=====================================================
// class ItemAComplate extends StatelessWidget {
//   const ItemAComplate({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SearchField<ItemModel>(
//       suggestions: _SalesOrderState._userProducets
//           .map((e) => SearchFieldListItem<ItemModel>(
//                 e.itemName.toString(),
//                 item: e,
//
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Padding(
//                     padding: const EdgeInsets.all(6.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           e.itemName.toString(),
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 // child: Padding(
//                 //   padding: const EdgeInsets.all(8.0),
//                 //   child: Row(
//                 //     children: [
//                 //       // CircleAvatar(
//                 //       //   backgroundImage: NetworkImage(e.doctorName),
//                 //       // ),
//                 //       SizedBox(width: 3),
//                 //       Text(e.doctorName),
//                 //     ],
//                 //   ),
//                 // ),
//               ))
//           .toList(),
//       suggestionState: Suggestion.expand,
//       onSuggestionTap: (SearchFieldListItem<ItemModel> item) {
//         //ItemAComplate();
//
//         // Fluttertoast.showToast(msg: ""+this.);
//
//         // Fluttertoast.showToast(
//         //   msg: 'Your Group ${item.item?.GroupName}',
//         // );
//       },
//     );
//   }
//
// //custom dialog
// }
class Doctor {
  static String? selectedDoctor = "";
  static String? selectedGroup = "";
}