import 'package:deeplaid_apps_models/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  List<ItemModel> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = widget.userProducetsGroupWise;
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

  @override
  void dispose() {
    searchController.removeListener(_filterList);
    searchController.dispose();
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
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(filteredList[index].itemName.toString()),
                        ),
                        Container(
                          width: 50,
                          child: TextField(
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Qty',
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
                      print('Selected Item ${filteredList[index].itemName}');
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
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
            //Fluttertoast.showToast(msg: "Add item");
          },
        ),
        TextButton(
          child: Text('Add Product'),
          onPressed: () {
            Fluttertoast.showToast(msg: "Add item");
          },
        ),
      ],
    );
  }
}
