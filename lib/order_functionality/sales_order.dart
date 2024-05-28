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

  //     Customar(strCustomerName: 'Alice', strPhone: '01700712772'),
  //     Customar(strCustomerName: 'Bob', strPhone: '01700712774'),
  //     Customar(strCustomerName: 'Charlie', strPhone: '01700712775'),
  // ];
  String _selectedCountry = '';

  @override
  void initState() {
    if (_userOptions.isEmpty) {
      getStudents();
      print("called ");
    }
  }

  Future<void> getStudents() async {
    List<Customar> employees = await dbHelper.getEmployees();

    for (int a = 0; a < employees.length; a++) {
      //print('Customer Name: ${employee.doctorName}, Phone: ${employee.doctorPhone}');
      _userOptions.add(Customar(
          doctorName: employees[a].doctorName,
          doctorPhone: employees[a].doctorPhone));
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
                      "Customar:★  ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: deviceHight * 0.70,
                      width: deviceWidth * 0.7,
                      child: AutocompleteBasicUserExample(),
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

class AutocompleteBasicUserExample extends StatelessWidget {
  const AutocompleteBasicUserExample({super.key});

  // static const List<Customar> _userOptions = <Customar>[
  //   Customar(strCustomerName: 'Alice', strPhone: '01700712772'),
  //   Customar(strCustomerName: 'Bob', strPhone: '01700712774'),
  //   Customar(strCustomerName: 'Charlie', strPhone: '01700712775'),
  // ];

  //Populate the _userOptions list using a loop
  // for(var item in data) {
  //     _userOptions.add(Customar(item['name'], item['age']));
  // }

  static String _displayStringForOption(Customar option) => option.doctorName;

  //static String _displayStringForOption(Customar option) => option.strPhone;

  @override
  Widget build(BuildContext context) {
    // return Autocomplete<Customar>(
    //   displayStringForOption: _displayStringForOption,
    //   optionsBuilder: (TextEditingValue textEditingValue) {
    //     if (textEditingValue.text == '') {
    //       return const Iterable<Customar>.empty();
    //     }
    //     return _SalesOrderState._userOptions.where((Customar option) {
    //       return option
    //           .toString()
    //           .contains(textEditingValue.text.toLowerCase());
    //     });
    //   },
    //   onSelected: (Customar selection) {
    //     Fluttertoast.showToast(
    //         msg: 'You just selected ${_displayStringForOption(selection)}');
    //     //debugPrint('You just selected ${_displayStringForOption(selection)}');
    //   },
    // );

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

    // return SearchField<Customar>(
    //
    //
    //   suggestions: _SalesOrderState._userOptions
    //       .map((e) => SearchFieldListItem<Customar>(
    //       e.doctorName,
    //       item: e,
    //
    //
    //       // Use child to show Custom Widgets in the suggestions
    //       // defaults to Text widget
    //       child: Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Row(
    //           children: [
    //             // CircleAvatar(
    //             //   backgroundImage: NetworkImage(e.doctorName),
    //             // ),
    //             SizedBox(
    //               width: 03,
    //             ),
    //             Text(e.doctorName),
    //             //selectd = e.doctorName.toString();
    //
    //           ],
    //         ),
    //       ),
    //     ),
    //   ).toList(),
    //
    //   suggestionState: Suggestion.expand,
    //
    //
    //
    //   onTap: (){
    //     Fluttertoast.showToast(
    //                 msg: 'You just selected ');
    //             //debugPrint('You just selected ${_displayStringForOption(selection)}');
    //   },
    // );
  }
}
