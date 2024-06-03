import 'package:deeplaid_apps_models/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/final_order_model.dart';

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

  //for submit order lists
  List<BranchID> list_BranchID = [];
  List<Detail> list_Details = [];
  List<DoctorInfo> list_DoctorInfo = [];
  List<Summary> list_Summary = [];

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
              padding: EdgeInsets.all(6.0), // Add padding around the TextField
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
                            decoration: InputDecoration(
                              hintText: '0',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      // Handle item selection


                      print(
                          'Selected Item ${filteredList[index].itemName} with quantity ${quantityControllers[originalIndex].text}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Add Product'),
          onPressed: (){
            for(int i = 0; i < filteredList.length; i++){
              if(quantityControllers[i].text.isNotEmpty){

                print('Selected Item ${filteredList[i].itemName} with quantity ${quantityControllers[i].text}');


              }
            }
          }


          //_addNewProduct,
        ),
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
            //Fluttertoast.showToast(msg: "Add item");
          },
        ),
      ],
    );
  }
}
