import 'package:deeplaid_apps_models/model/dashboard_model.dart';
import 'package:flutter/material.dart';

class DashboardMaster extends StatelessWidget {
  final List<CollectionItem> dues;
  const DashboardMaster(this.dues, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        color: Colors.grey.shade50,
        child: (dues == null || dues.isEmpty)
            ?  Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: dues.length,
                itemBuilder: (context, index) {
                  final item = dues[index];
                  return ListTile(
                    title: Text(item.strProperty.toUpperCase()),
                    subtitle: Text('Amount: ${item.dblAmount.toString()}'),
                  );
                },
              ),
      ),
    );
  }
}
