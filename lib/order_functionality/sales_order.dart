import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  void getDoctorFromLdb() async {
    var productsFuture = dbHelper.getProductvs();
    productsFuture.then((data) {
      setState(() {
        this.doctors = data;
        this.suggestons = doctors.cast<String>();


        //productCount = data.length;
      });
    });



  }

  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery
        .of(context)
        .size
        .height;
    final deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
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
                      "Customar:★ ",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: deviceHight * 0.80,
                      width: deviceWidth * 0.7,
                      // child: RawAutocomplete(
                      //   optionsBuilder: (TextEditingValue textEditingValue) {
                      //     if (textEditingValue.text == '') {
                      //       return const Iterable<String>.empty();
                      //     } else {
                      //       List<String> matches = <String>[];
                      //       matches.add("he");
                      //       matches.add("go");
                      //       matches.add("gooo");
                      //       matches.addAll(doctors as Iterable<String>);
                      //
                      //       matches.retainWhere((s) {
                      //         return s.toLowerCase().contains(
                      //             textEditingValue.text.toLowerCase());
                      //       });
                      //       return matches;
                      //     }
                      //   },
                      //   onSelected: (String selection) {
                      //     Fluttertoast.showToast(msg: "$selection"); //for customar
                      //   },
                      //   fieldViewBuilder: (BuildContext context,
                      //       TextEditingController textEditingController,
                      //       FocusNode focusNode,
                      //       VoidCallback onFieldSubmitted) {
                      //     return TextField(
                      //       decoration:
                      //           InputDecoration(border: OutlineInputBorder()),
                      //       controller: textEditingController,
                      //       focusNode: focusNode,
                      //       onSubmitted: (String value) {},
                      //     );
                      //   },
                      //   optionsViewBuilder: (BuildContext context,
                      //       void Function(String) onSelected,
                      //       Iterable<String> options) {
                      //     return Material(
                      //         child: SizedBox(
                      //             height: 200,
                      //             width: 10,
                      //             child: SingleChildScrollView(
                      //                 child: Column(
                      //               children: options.map((opt) {
                      //                 return InkWell(
                      //                     onTap: () {
                      //                       onSelected(opt);
                      //                     },
                      //                     child: Container(
                      //                         padding:
                      //                             EdgeInsets.only(right: 120),
                      //                         child: Card(
                      //                             child: Container(
                      //                           width: double.infinity,
                      //                           padding: EdgeInsets.all(10),
                      //                           child: Text(opt),
                      //                         ))));
                      //               }).toList(),
                      //             ))));
                      //   },
                      // ),
                      child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          // In a real scenario, you would fetch options from an API or local data source.
                          // Here, we're using a static list of options for demonstration.
                          return <String>[
                            'Apple',
                            'Banana',
                            'Orange',
                            'Pineapple',
                            'Mango',
                          ].where((String option) {
                            return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                          }).toList();
                        },
                        onSelected: (String selection) {
                          setState(() {
                            _selectedCountry = selection;
                          });
                        },
                        fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                          _textEditingController.value = fieldTextEditingController.value;
                          return TextField(
                            controller: _textEditingController,
                            focusNode: fieldFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Type a fruit...',
                            ),
                            onChanged: (String value) {
                              onFieldSubmitted();
                            },
                          );
                        },
                        optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              elevation: 4.0,
                              child: SizedBox(
                                height: 200.0,
                                child: ListView.builder(
                                  padding: EdgeInsets.all(8.0),
                                  itemCount: options.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final String option = options.elementAt(index);
                                    return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                      },
                                      child: ListTile(
                                        title: Text(option),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: deviceHight * 0.08,
              //   width: deviceWidth,
              //   child: Row(
              //     children: [
              //       Text(
              //         "Group:★        ",
              //         style: TextStyle(
              //             fontSize: 17,
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       SizedBox(
              //         height: deviceHight * 0.80,
              //         width: deviceWidth * 0.7,
              //         child: RawAutocomplete(
              //           optionsBuilder: (TextEditingValue textEditingValue) {
              //             if (textEditingValue.text == '') {
              //               return const Iterable<String>.empty();
              //             } else {
              //               List<String> matches = <String>[];
              //               matches.addAll(suggestons);
              //
              //               matches.retainWhere((s) {
              //                 return s.toLowerCase().contains(
              //                     textEditingValue.text.toLowerCase());
              //               });
              //               return matches;
              //             }
              //           },
              //           onSelected: (String selection) {
              //             Fluttertoast.showToast(msg: "$selection"); // for group
              //           },
              //           fieldViewBuilder: (BuildContext context,
              //               TextEditingController textEditingController,
              //               FocusNode focusNode,
              //               VoidCallback onFieldSubmitted) {
              //             return TextField(
              //               decoration:
              //               InputDecoration(border: OutlineInputBorder()),
              //               controller: textEditingController,
              //               focusNode: focusNode,
              //               onSubmitted: (String value) {},
              //             );
              //           },
              //           optionsViewBuilder: (BuildContext context,
              //               void Function(String) onSelected,
              //               Iterable<String> options) {
              //             return Material(
              //                 child: SizedBox(
              //                     height: 180,
              //                     width: 10,
              //                     child: SingleChildScrollView(
              //                         child: Column(
              //                           children: options.map((opt) {
              //                             return InkWell(
              //                                 onTap: () {
              //                                   onSelected(opt);
              //                                 },
              //                                 child: Container(
              //                                     padding:
              //                                     EdgeInsets.only(right: 120),
              //                                     child: Card(
              //                                         child: Container(
              //                                           width: double.infinity,
              //                                           padding: EdgeInsets.all(10),
              //                                           child: Text(opt),
              //                                         ))));
              //                           }).toList(),
              //                         ))));
              //           },
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}


