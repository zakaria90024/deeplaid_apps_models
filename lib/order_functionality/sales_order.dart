import 'package:deeplaid_apps_models/model/group_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:searchfield/searchfield.dart';

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
  static late String selectd = "";
  var dbHelper = DBHelper();
  late List<dynamic> doctors;
  late List<String> suggestons;
  final TextEditingController _textEditingController = TextEditingController();
  static TextEditingController searchControllers = TextEditingController();
  final List<String> _countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    // ... (more countries)
  ];
  List<String> suggestions = [];
  List<Customar> _items = [];
  static late List<Customar> _userOptions = [];
  static late List<GroupModel> _userGroup = [];

  @override
  void initState() {
    if (_userOptions.isEmpty) {
      getCustomars();
      print("called ");
    }
  }

  Future<void> getCustomars() async {
    List<Customar> employees = await dbHelper.getDoctorOrParty();

    for (int a = 0; a < employees.length; a++) {
      //print('Customer Name: ${employee.doctorName}, Phone: ${employee.doctorPhone}');
      _userOptions.add(Customar(
          doctorName: employees[a].doctorName,
          doctorPhone: employees[a].doctorPhone));
    }
  }


  Future<void> getGroups() async {

    List<GroupModel> employees = await dbHelper.getGroups();
    for (int a = 0; a < employees.length; a++) {
      //print('Customer Name: ${employee.doctorName}, Phone: ${employee.doctorPhone}');
      _userGroup.add(GroupModel(
           GroupName: employees[a].GroupName));
    }

  }

  // Future<void> _fetchItems() async {
  //
  //
  //   //List<Customar> cso = [];
  //   final cso = await dbHelper.getDoctorsList();
  //
  //   cso.asMap();
  //
  //
  //     _userOptions.addAll(cso as Iterable<Customar>);
  //   //}
  //
  //   //_items = items.map((item) => Customar.fromMap(item)).toList();
  // }

  //Read
  // Future<List<Customar>> getStudents() async {
  //   _userOptions = dbHelper.getDoctorsList();
  //   return _userOptions;
  // }

  // void getDoctorFromLdb() async {
  //   var productsFuture = dbHelper.getDoctorsList();
  //
  //   _userOptions = productsFuture;
  //
  //   productsFuture.then((data) {
  //     setState(() {
  //       this.doctors = data;
  //       this.suggestons = doctors.cast<String>();
  //       //productCount = data.length;
  //
  //
  //
  //
  //       print(data);
  //       Fluttertoast.showToast(msg: "dd"+data.length.toString());
  //
  //
  //
  //       // _userOptions = data.map((item) => Customar(
  //       //     strCustomerName: item['strCustomerName'],
  //       //     strPhone: item['strPhone']
  //       // )).toList();
  //
  //
  //       //_userOptions.add(data as Customar);
  //       // for(var item in data) {
  //       //   _userOptions.add(data as Customar);
  //       // }
  //
  //     });
  //   });
  //
  // }

  // void getDoctorFromLdb() async {
  //
  //
  //
  //   var doctorsFuture = dbHelper.getDoctorsList();
  //
  //
  //   for(int a = 0; a < 4; a++){
  //     _userOptions.add(Customar(strCustomerName: "helo", strPhone: "go"));
  //   }
  //
  //
  //   // Handling the future when it completes
  //   // doctorsFuture.then((data) {
  //   //   setState(() {
  //   //     // Updating the state with the fetched doctors list
  //   //     this.doctors = data;
  //   //
  //   //     // Logging the data
  //   //     print(data);
  //   //
  //   //     // Displaying a toast with the number of doctors fetched
  //   //     Fluttertoast.showToast(msg: "Number of doctors: " + data.length.toString());
  //   //   });
  //   // });
  // }

  // void getDoctorFromLdb() async {
  //   //try {
  //     // Fetching the list of doctors asynchronously
  //     var doctorsList = await dbHelper.getDoctorsList();
  //
  //     setState(() {
  //       // Updating the state with the fetched doctors list
  //       this.doctors = doctorsList;
  //
  //       // Creating a list of doctor names for suggestions
  //       //this.suggestions = doctorsList.map((doctor) => doctor.strCustomerName).toList();
  //
  //
  //
  //       for(int a = 0; a <= 29; a++){
  //         _userOptions[a].strCustomerName = doctors[a].toString();
  //       }
  //
  //
  //       //_userOptions = doctorsList;
  //
  //       // Logging the data
  //       print(doctorsList);
  //
  //       // Displaying a toast with the number of doctors fetched
  //       Fluttertoast.showToast(msg: "Number of doctors: " + doctorsList.length.toString());
  //     });
  //   // } catch (error) {
  //   //   // Handling any errors that occur during fetching
  //   //   print("Error fetching doctors: $error");
  //   //   Fluttertoast.showToast(msg: "Failed to fetch doctors");
  //   // }
  // }

  // void getDoctorFromLdb() async {
  //   var productsFuture = dbHelper.getProductvsList();
  //
  //   productsFuture.then((data) {
  //     setState(() {
  //       //doctors = data.toList();
  //       _userOptions.addAll(data);
  //
  //       //_userOptions.d
  //
  //
  //       // //productCount = data.length;
  //       // for(int a = 0; a < 140; a++){
  //       //   //_userOptions.add(Customar(mpo: 'fsdf', strCustomerName: ''+doctors[a].toString(), straddress:'dfgfdg', strPhone: 'fdgfdg'));
  //       //   _userOptions.add(Customar("sdfsdf", "sdfsdf" as int));
  //       // }
  //
  //
  //     });
  //   });
  //
  //
  //   // for(int a = 0; a < doctors.length; a++){
  //   //   //_userOptions.add(Customar(mpo: 'fsdf', strCustomerName: ''+doctors[a].toString(), straddress:'dfgfdg', strPhone: 'fdgfdg'));
  //   //   _userOptions.add(Customar, doctors[a].toString()));
  //   // }
  //
  //   //
  //
  //
  // }

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
            ],
          ),
        ),
      ),
    );
  }
}

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
        Fluttertoast.showToast(
          msg: 'You just selected ${item.item?.doctorName}',
        );
      },
    );






  }
}

class GroupAComplate extends StatelessWidget {
  const GroupAComplate({super.key});

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

        _SalesOrderState().dbHelper.getGroups();
        Fluttertoast.showToast(
          msg: 'You just selected ${item.item?.doctorName}',
        );
      },
    );


