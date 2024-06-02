import 'package:deeplaid_apps_models/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void showCustomDialog(BuildContext context, List<ItemModel> userProducetsGroupWise) {
  TextEditingController searchController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userProducetsGroupWise.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(userProducetsGroupWise[index].itemName.toString()),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Handle item selection
                        print('Selected Item ${userProducetsGroupWise[index].itemName}');
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
            onPressed: () {
              Fluttertoast.showToast(msg: "add item");
            },
          ),
          // TextButton(
          //   child: Text('Close'),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      );
    },
  );
}