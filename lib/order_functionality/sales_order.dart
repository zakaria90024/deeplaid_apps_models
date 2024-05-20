import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    // ... (more countries)
  ];

  static late List<Customar> _userOptions ;
    // Customar(strCustomerName: 'Alice', strPhone: '01700712772'),
    // Customar(strCustomerName: 'Bob', strPhone: '01700712774'),
    // Customar(strCustomerName: 'Charlie', strPhone: '01700712775'),
  //];
  String _selectedCountry = '';

  @override
  void initState() {
    super.initState();

    // dbHelper = DBHelper();
    // doctors = dbHelper!.getDoctors();
    // Fluttertoast.showToast(msg: "todls${doctors}");

    getDoctorFromLdb();
    //suggestons = doctors.cast<String>();

    //refreshDRList();
  }

  // void getDoctorFromLdb() async {
  //   var productsFuture = dbHelper.getProductvs();
  //   productsFuture.then((data) {
  //     setState(() {
  //       this.doctors = data;
  //       this.suggestons = doctors.cast<String>();
  //       //productCount = data.length;
  //
  //
  //
  //
  //
  //
  //       print(data);
  //       Fluttertoast.showToast(msg: "dd"+data.length.toString());
  //
  //
  //
  //       _userOptions = data.map((item) => Customar(
  //           strCustomerName: item['strCustomerName'],
  //           strPhone: item['strPhone']
  //       )).toList();
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

  void getDoctorFromLdb() async {
    var productsFuture = dbHelper.getProductvs();

    productsFuture.then((data) {
      setState(() {
        doctors = data.toList();



      });
    });


    //productCount = data.length;
    for(int a = 0; a < doctors.length; a++){
      _userOptions.add(Customar(mpo: 'fsdf', strCustomerName: ''+doctors[a].toString(), straddress:'dfgfdg', strPhone: 'fdgfdg'));
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
                      "Customar:★  ",
                      style: TextStyle(
                          fontSize: 17,
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
  //

  //Populate the _userOptions list using a loop
  // for(var item in data) {
  //     _userOptions.add(Customar(item['name'], item['age']));
  // }

  static String _displayStringForOption(Customar option) => option.strCustomerName;

  //static String _displayStringForOption(Customar option) => option.strPhone;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Customar>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Customar>.empty();
        }
        return _SalesOrderState._userOptions.where((Customar option) {
          return option
              .toString()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (Customar selection) {
        Fluttertoast.showToast(
            msg: 'You just selected ${_displayStringForOption(selection)}');
        //debugPrint('You just selected ${_displayStringForOption(selection)}');
      },
    );
  }
}
