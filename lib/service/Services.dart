import 'dart:convert';
import 'package:deeplaid_apps_models/model/commision_model.dart';
import 'package:deeplaid_apps_models/model/doctor_model.dart';
import 'package:deeplaid_apps_models/model/group_model.dart';
import 'package:deeplaid_apps_models/model/item_model.dart';
import 'package:deeplaid_apps_models/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Services {
  static const root = 'http://192.168.1.63:8080/api';
  static const urlPrefix = 'http://localhost:8086/EmployesDB';


  static const String _GET_ACTION = 'GET_ALL';
  static const String _CREATE_TABLE = 'CREATE_TABLE';
  static const String _ADD_EMP_ACTION = 'ADD_EMP';
  static const String _UPDATE_EMP_ACTION = 'UPDATE_EMP';
  static const String _DELETE_EMP_ACTION = 'DELETE_EMP';

  static Future<List<DoctorModel>> getDoctor() async {
    final url = Uri.parse('$root/GetCustomer/309');
    final response = await http.get(url);
    print("getDoctor >> Response:: ${response.statusCode}");
    if (response.statusCode == 200) {

      final jsonData = jsonDecode(response.body);
      final List<dynamic> dataList = jsonData.cast<dynamic>();
      final List<DoctorModel> myDataList = dataList.map((data) => DoctorModel.fromJson(data)).toList();
      return myDataList;

    } else {
      throw <DoctorModel>[];
    }
  }



  static Future<List<GroupModel>> getGroup() async {
    final url = Uri.parse('$root/StockGroup?branchid=0001');
    final response = await http.get(url);
    print("getDoctor >> Response:: ${response.statusCode}");
    if (response.statusCode == 200) {

      final jsonData = jsonDecode(response.body);
      final List<dynamic> dataList = jsonData.cast<dynamic>();
      final List<GroupModel> myDataList = dataList.map((data) => GroupModel.fromJson(data)).toList();
      return myDataList;

    } else {
      throw <GroupModel>[];
    }
  }


  static Future<List<ItemModel>> getItem() async {
    final url = Uri.parse('$root/mLoadItemRate?branchid=0001&strTC=001');
    final response = await http.get(url);
    print("getDoctor >> Response:: ${response.statusCode}");
    if (response.statusCode == 200) {

      final jsonData = jsonDecode(response.body);
      final List<dynamic> dataList = jsonData.cast<dynamic>();
      final List<ItemModel> myItemList = dataList.map((data) => ItemModel.fromJson(data)).toList();
      return myItemList;

    } else {
      throw <GroupModel>[];
    }
  }


  static Future<List<CommissionSlabModel>> getCommission() async {
    final url = Uri.parse('$root/Commissionslab');
    final response = await http.get(url);
    print("getDoctor >> Response:: ${response.statusCode}");
    if (response.statusCode == 200) {

      final jsonData = jsonDecode(response.body);
      final List<dynamic> dataList = jsonData.cast<dynamic>();
      final List<CommissionSlabModel> myItemList = dataList.map((data) => CommissionSlabModel.fromJson(data)).toList();
      return myItemList;

    } else {
      throw <GroupModel>[];
    }
  }




  //
  // static Future<List<DoctorModel>> getEmployees() async {
  //   try {
  //     //var map = new Map<String, dynamic>();
  //     final url = Uri.parse('$root/GetCustomer/309');
  //     //print("getEmployees >> Response:: ${response.body}");
  //     if (response.statusCode == 200) {
  //       List<DoctorModel> list = parsePhotos(response.body);
  //       return list;
  //     } else {
  //       throw <DoctorModel>[];
  //     }
  //   } catch (e) {
  //     return <DoctorModel>[];
  //   }
  // }

  static List<DoctorModel> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<DoctorModel>((json) => DoctorModel.fromJson(json))
        .toList();
  }

  // static List<DoctorModel> parsePhotos(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<DoctorModel>((json) => DoctorModel.fromMap(json)).toList();
  // }
  //
  // static Future<String> createTable() async {
  //   try {
  //     var map = new Map<String, dynamic>();
  //     map["action"] = _CREATE_TABLE;
  //     final response = await http.post(Uri.parse(root), body: map);
  //     print("createTable >> Response:: ${response.body}");
  //     return response.body;
  //   } catch (e) {
  //     return 'error';
  //   }
  // }

  //for test valid number
  static Future<String> getValidNumber(String number) async {
    final url = Uri.parse('$root/OTPVerification/Post');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'Mobile': number,
        'Token': 'tokenId',
      },
    );

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
      return response.body;
    } else {
      return 'POST request failed with status: ${response.statusCode}.';
    }
  }

  //for mpo login
  static Future<LoginModel> getValidLogin(String userID, String Password, String branchid) async {
    final url = Uri.parse('$root/MPO/post');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'UserID': userID,
        'Password': Password,
        'branchid': branchid,
        "empcardNo":""
      },
    );

    if (response.statusCode == 200) {
      // Parse the response body as JSON.
      final todo = LoginModel.fromJson(jsonDecode(response.body));
      return todo;
    } else {
      throw <LoginModel>[];
    }
  }

  static Future<String> addEmployee(String firstName, String lastName) async {
    try {
      var map = new Map<String, dynamic>();
      map["action"] = _ADD_EMP_ACTION;
      map["first_name"] = firstName;
      map["last_name"] = lastName;
      final response = await http.post(Uri.parse(root), body: map);
      print("addEmployee >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> updateEmployee(String empId, String firstName, String lastName) async {
    try {
      var map = new Map<String, dynamic>();
      map["action"] = _UPDATE_EMP_ACTION;
      map["emp_id"] = empId;
      map["first_name"] = firstName;
      map["last_name"] = lastName;
      final response = await http.post(Uri.parse(root), body: map);
      print("deleteEmployee >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> deleteEmployee(String empId) async {
    try {
      var map = <String, dynamic>{};
      map["action"] = _DELETE_EMP_ACTION;
      map["emp_id"] = empId;
      final response = await http.post(Uri.parse(root), body: map);
      print("deleteEmployee >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }
}
