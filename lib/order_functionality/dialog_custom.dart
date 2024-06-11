import 'dart:convert';
import 'dart:math';

import 'package:deeplaid_apps_models/model/item_model.dart';
import 'package:deeplaid_apps_models/order_functionality/sales_order.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../model/final_order_model.dart';
import '../sqlitehelper_deeplaid_apps/sqlitehelper.dart';

void showCustomDialog(
    BuildContext context, List<ItemModel> userProducetsGroupWise) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(userProducetsGroupWise: userProducetsGroupWise);
    },
  );
}

class CustomDialog extends StatefulWidget {
  final List<ItemModel> userProducetsGroupWise;

  CustomDialog({required this.userProducetsGroupWise});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  TextEditingController searchController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController newProductNameController = TextEditingController();
  TextEditingController newProductQtyController = TextEditingController();
  List<ItemModel> filteredList = [];
  List<TextEditingController> quantityControllers = [];

  var dbHelper = DBHelper();

  //for submit order lists
  List<BranchID> listBranchId = [];
  static List<Detail> listDetails = [];
  List<DoctorInfo> listDoctorInfo = [];
  List<Summary> listSummary = [];

  //unique
  int? milisec;

  @override
  void initState() {
    super.initState();
    filteredList = widget.userProducetsGroupWise;
    quantityControllers = List.generate(
        widget.userProducetsGroupWise.length, (_) => TextEditingController());
    searchController.addListener(_filterList);
  }

  void _filterList() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredList = widget.userProducetsGroupWise.where((item) {
        return item.itemName!.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _addNewProduct() {
    if (newProductNameController.text.isNotEmpty &&
        newProductQtyController.text.isNotEmpty) {
      setState(() {
        widget.userProducetsGroupWise.add(ItemModel(
            commgroupgame: "",
            dblPartyvalue: "",
            dblRate: "",
            dblcomboMaxvalue: "",
            dblcomboMinqty: "",
            groupName: "",
            itemName: quantityControllers[0].text,
            itemcode: "",
            depot: ""));

        quantityControllers
            .add(TextEditingController(text: newProductQtyController.text));
        filteredList =
            widget.userProducetsGroupWise; // Refresh the filtered list
      });
      newProductNameController.clear();
      newProductQtyController.clear();
      Fluttertoast.showToast(msg: "Product added");
    } else {
      Fluttertoast.showToast(
          msg: "Please enter both product name and quantity");
    }
  }

  @override
  void dispose() {
    searchController.removeListener(_filterList);
    searchController.dispose();
    for (var controller in quantityControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              // Add padding around the TextField
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Search Item',
                  prefixIconColor: Colors.grey,
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  // Add padding inside the TextField
                  border:
                      OutlineInputBorder(), // Optional: Add border to the TextField
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredList.length,
                itemBuilder: (BuildContext context, int index) {
                  int originalIndex = widget.userProducetsGroupWise
                      .indexOf(filteredList[index]);

                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(filteredList[index].itemName.toString()),
                        ),
                        Container(
                          width: 50,
                          child: TextField(
                            controller: quantityControllers[originalIndex],
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: '0',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // onTap: () {
                    //   Navigator.of(context).pop();
                    //   // Handle item selection
                    //
                    //   print(
                    //       'Selected Item ${filteredList[index].itemName} with quantity ${quantityControllers[originalIndex].text}');
                    // },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            child: const Text('Add Product'),
            onPressed: () {
              DateTime now = DateTime.now();
              String formattedDate = DateFormat('dd-MM-yyyy').format(now);

                var productsFuture = dbHelper.getUserInfo();
                productsFuture.then((data) {
                  setState(() {

                    //productsFuture.toString();
                    listBranchId.add(BranchID(strBranchID: "0001"));

                    //this.doctors = data;
                    //productCount = data.length;

                  });
                });


              //UUID make orderid unique =======================================
              if (milisec == null) {
                DateTime now = DateTime.now();
                int year = now.year;
                int month = now.month;
                int day = now.day;
                int hh = now.hour;
                int mm = now.minute;
                int ss = now.second;

                month = month +
                    1; // Dart's DateTime month is already 1-based, no need to adjust
                hh = (hh + 12) % 24; // Ensuring 24-hour format
                String currentDate = "$day-$month-$year $hh:$mm:$ss";
                // Format current date and time to 'dd-MM-yyyy HH:mm:ss'
                String formattedDate =
                    "$day-${month.toString().padLeft(2, '0')}-${year.toString()} "
                    "${hh.toString().padLeft(2, '0')}:${mm.toString().padLeft(2, '0')}:${ss.toString().padLeft(2, '0')}";

                // Generate a unique order ID
                int max = 9;
                int min = 1;
                Random random = Random();
                int b = min + random.nextInt(max - min + 1);
                String x = b.toString();
                int orderId = now.millisecondsSinceEpoch;
                String oid = orderId.toString().substring(4, 13);
                // Construct the final order ID
                int p = int.parse(x + oid);

                // Print the values
                print("Current Date: $currentDate");
                print("Formatted Date: $formattedDate");
                print("Order ID: $p");

                milisec = p;
              }
              //end UUID make orderid unique ===================================

              print("Final milisec: $milisec");

              for (int i = 0; i < filteredList.length; i++) {
                if (quantityControllers[i].text.isNotEmpty) {
                  listDetails.add(Detail(
                      date: formattedDate,
                      doctorName: Doctor.selectedDoctor.toString(),
                      groupName: Doctor.selectedGroup.toString(),
                      itemName: filteredList[i].itemName.toString(),
                      itemPrice: double.parse(filteredList[i].dblRate.toString()),
                      itemQuentity: int.parse(quantityControllers[i].text),
                      itemTotalPrice: double.parse(filteredList[i].dblRate.toString()) * int.parse(quantityControllers[i].text), //single price * qty
                      mpo: listBranchId[0].strBranchID,
                      newCustomer: "",
                      orderid: int.parse(milisec.toString()),
                      slabgroupName: filteredList[i].commgroupgame.toString()));
                }

                //print('Selected Item ${listDetails[i].itemName} with quantity ${listDetails[i].itemQuentity}');
              }

              // for (var item in listDetails) {
              //   print(item.itemName+"-"+item.itemQuentity.toString()); // This will call the toString() method of the Detail class
              // }



              // Create the final JSON object
              Map<String, dynamic> jsonData = {
                "branchID": listBranchId.map((e) => e.toJson()).toList(),
                "details": listDetails.map((e) => e.toJson()).toList(),
                //"doctorinfo": doctorinfo.map((e) => e.toJson()).toList(),
                //"summary": summary.map((e) => e.toJson()).toList(),
              };

              // Convert to JSON string
              String jsonString = jsonEncode(jsonData);
              print(jsonString);
              Fluttertoast.showToast(msg: ""+jsonString);
              Navigator.of(context).pop();
              ProductListDetails.listDetailsCopy = listDetails;
              ShowItemListViewCall();
            }
            //_addNewProduct,
            ),
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
            //Fluttertoast.showToast(msg: "Add item");
          },
        ),
      ],
    );
  }
}

class ProductListDetails {
  static List<Detail> listDetailsCopy = [];
}
