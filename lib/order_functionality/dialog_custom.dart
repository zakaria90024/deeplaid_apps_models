import 'package:deeplaid_apps_models/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomDialog(BuildContext context, List<ItemModel> userProducetsGroupWise) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select an Item'),
        content: Container(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: userProducetsGroupWise.length, // Number of items in the ListView
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(userProducetsGroupWise[index].itemName.toString()),
                onTap: () {
                  Navigator.of(context).pop();
                  // Handle item selection
                  print('Selected Item $index');
                },
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Add Product'),
            onPressed: () {
              Fluttertoast.showToast(msg: "item added ");
            },
          ),

          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}