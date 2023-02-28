import 'package:deeplaid_apps_models/model/doctor_model.dart';
import 'package:deeplaid_apps_models/sqlitehelper_deeplaid_apps/sqlitehelper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DBTestPage extends StatefulWidget {
  final String title;

  DBTestPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DBTestPageState();
  }
}

class _DBTestPageState extends State<DBTestPage> {
  //
  late Future<List<DoctorModel>> employees;
  TextEditingController controller = TextEditingController();
  late String name;
  late String curUserId;

  final formKey = GlobalKey<FormState>();
  var dbHelper;
  late bool isUpdating;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      employees = dbHelper!.getEmployees();
    });
  }

  clearName() {
    controller.text = '';
  }

  validate() {
    // if (formKey.currentState.validate()) {
    formKey.currentState?.save();
    if (isUpdating) {
      DoctorModel e = DoctorModel("ds", "sdf", "fsdf", name);
      dbHelper.update(e);
      setState(() {
        isUpdating = false;
      });
    } else {
      DoctorModel e = DoctorModel("ds", "sdf", "sdfsd", name);
      dbHelper.save(e);
    }
    clearName();
    refreshList();
    //}
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (val) => val?.length == 0 ? 'Enter Name' : null,
              onSaved: (val) => name = val!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: validate,
                  child: Text(isUpdating ? 'UPDATE' : 'ADD'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isUpdating = false;
                    });
                    clearName();
                  },
                  child: const Text('CANCEL'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView dataTable(List<DoctorModel> employees) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text('NAME'),
          ),
          DataColumn(
            label: Text('DELETE'),
          )
        ],
        rows: employees
            .map(
              (employee) => DataRow(cells: [
                DataCell(
                  Text("${employee.mpo}"),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curUserId = employee.mpo!;
                    });
                    controller.text = employee.strCustomerName!;
                  },
                ),
                DataCell(IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    dbHelper.delete(employee.mpo);
                    refreshList();
                  },
                )),
              ]),
            )
            .toList(),
      ),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future: employees,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data as List<DoctorModel>);
          }

          if (null == snapshot.data) {
            return const Text("No Data Found");
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQlite'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            form(),
            list(),
          ],
        ),
      ),
    );
  }
}
