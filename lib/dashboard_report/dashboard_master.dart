import 'package:deeplaid_apps_models/model/dashboard_model.dart';
import 'package:flutter/material.dart';

class DashboardMaster extends StatelessWidget {
  final List<CollectionItem> dues;

  const DashboardMaster(this.dues, {super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     child: Container(
  //       color: Colors.grey.shade50,
  //       child: (dues == null || dues.isEmpty)
  //           ?  Center(child: CircularProgressIndicator())
  //           : ListView.builder(
  //               itemCount: dues.length,
  //               itemBuilder: (context, index) {
  //                 final item = dues[index];
  //                 return ListTile(
  //                   title: Text(item.strProperty.toUpperCase()),
  //                   subtitle: Text('Amount: ${item.dblAmount.toString()}'),
  //
  //                 );
  //               },
  //             ),
  //     ),
  //   );
  // }

  //
  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     child: Container(
  //       color: Colors.grey.shade50,
  //       child: (dues == null || dues.isEmpty)
  //           ? Center(child: CircularProgressIndicator())
  //           : ListView.builder(
  //         itemCount: dues.length,
  //         itemBuilder: (context, index) {
  //           final item = dues[index];
  //           return Card(
  //             margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
  //             elevation: 5, // Add shadow to the card
  //             child: ListTile(
  //               title: Text(item.strProperty.toUpperCase()),
  //               subtitle: Text('Amount: ${item.dblAmount.toString()}'),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     child: Container(
  //       color: Colors.grey.shade50,
  //       child: (dues == null || dues.isEmpty)
  //           ? Center(child: CircularProgressIndicator())
  //           : GridView.builder(
  //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 2, // Two columns
  //                 crossAxisSpacing: 8.0, // Space between columns
  //                 mainAxisSpacing: 8.0, // Space between rows
  //               ),
  //               itemCount: dues.length,
  //               itemBuilder: (context, index) {
  //                 final item = dues[index];
  //                 return Card(
  //                   elevation: 5, // Add shadow to the card
  //                   child: ListTile(
  //                     title: Text(item.strProperty.toUpperCase()),
  //                     subtitle: Text('Amount: ${item.dblAmount.toString()}'),
  //                   ),
  //                 );
  //               },
  //             ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        color: Colors.grey.shade50,
        child: (dues == null || dues.isEmpty)
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two columns
            crossAxisSpacing: 8.0, // Space between columns
            mainAxisSpacing: 8.0, // Space between rows
          ),
          itemCount: dues.length,
          itemBuilder: (context, index) {
            final item = dues[index];
            return Card(
              elevation: 1, // Add shadow to the card
              child: SizedBox(
                height: 60, // Set your desired height here
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item.strProperty.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Amount: ${item.dblAmount.toString()}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}
