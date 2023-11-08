import 'package:deeplaid_apps_models/order_functionality/sales_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderType extends StatefulWidget {
  const OrderType({super.key});

  @override
  State<OrderType> createState() => _OrderTypeState();
}

class _OrderTypeState extends State<OrderType> {
  // Initial Selected Value
  String dropdownValue = '--Select One--';

// List of items in our dropdown menu
  var item = ['Dilution', 'Others'];

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("--Select One--"), value: "--Select One--"),
      DropdownMenuItem(child: Text("Dilution"), value: "Dilution"),
      DropdownMenuItem(child: Text("Others"), value: "Others"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

                  Text("Select Order Type", style: TextStyle(fontSize: 16, color: Colors.black),),

                ],
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  DropdownButton(
                    items: dropdownItems,
                    value: "--Select One--",
                    onChanged: (value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SalesOrder()));
                    },
                  )

                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
