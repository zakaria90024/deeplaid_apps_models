import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SalesOrder extends StatefulWidget {
  const SalesOrder({super.key});

  @override
  State<SalesOrder> createState() => _SalesOrderState();
}

class _SalesOrderState extends State<SalesOrder> {
  late var totalAmount = "0.0";
  late var tc = "085";
  List<String> suggestons = [
    "USA",
    "UK",
    "Uganda",
    "Uruguay",
    "United Arab Emirates"
  ];

  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
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
                      child: RawAutocomplete(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<String>.empty();
                          } else {
                            List<String> matches = <String>[];
                            matches.addAll(suggestons);

                            matches.retainWhere((s) {
                              return s.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase());
                            });
                            return matches;
                          }
                        },
                        onSelected: (String selection) {
                          Fluttertoast.showToast(msg: "$selection"); //for customar
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          return TextField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            controller: textEditingController,
                            focusNode: focusNode,
                            onSubmitted: (String value) {},
                          );
                        },
                        optionsViewBuilder: (BuildContext context,
                            void Function(String) onSelected,
                            Iterable<String> options) {
                          return Material(
                              child: SizedBox(
                                  height: 200,
                                  width: 10,
                                  child: SingleChildScrollView(
                                      child: Column(
                                    children: options.map((opt) {
                                      return InkWell(
                                          onTap: () {
                                            onSelected(opt);
                                          },
                                          child: Container(
                                              padding:
                                                  EdgeInsets.only(right: 120),
                                              child: Card(
                                                  child: Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.all(10),
                                                child: Text(opt),
                                              ))));
                                    }).toList(),
                                  ))));
                        },
                      ),
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
                      "Group:★        ",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: deviceHight * 0.80,
                      width: deviceWidth * 0.7,
                      child: RawAutocomplete(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<String>.empty();
                          } else {
                            List<String> matches = <String>[];
                            matches.addAll(suggestons);

                            matches.retainWhere((s) {
                              return s.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase());
                            });
                            return matches;
                          }
                        },
                        onSelected: (String selection) {
                          Fluttertoast.showToast(msg: "$selection"); // for group
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          return TextField(
                            decoration:
                            InputDecoration(border: OutlineInputBorder()),
                            controller: textEditingController,
                            focusNode: focusNode,
                            onSubmitted: (String value) {},
                          );
                        },
                        optionsViewBuilder: (BuildContext context,
                            void Function(String) onSelected,
                            Iterable<String> options) {
                          return Material(
                              child: SizedBox(
                                  height: 180,
                                  width: 10,
                                  child: SingleChildScrollView(
                                      child: Column(
                                        children: options.map((opt) {
                                          return InkWell(
                                              onTap: () {
                                                onSelected(opt);
                                              },
                                              child: Container(
                                                  padding:
                                                  EdgeInsets.only(right: 120),
                                                  child: Card(
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding: EdgeInsets.all(10),
                                                        child: Text(opt),
                                                      ))));
                                        }).toList(),
                                      ))));
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
