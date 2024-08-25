import 'dart:convert';

import 'package:deeplaid_apps_models/service/Services.dart';
import 'package:http/http.dart' as http;
import '../../model/dashboard_model.dart';
import 'dashboard_view.dart';

class DashboardPresenter{

  late DashboardInterfaceView dashboardInterfaceView ;
  late Services services;



  DashboardPresenter(this.dashboardInterfaceView){
    services = Services();
  }

  void getDashboardData(
      String strUserName,
      String strFdate,
      String strTdate,
      String strBranchid,
      ) async {
    final String url = Services.root+'/AppsDashboard';
    final Map<String, String> queryParams = {
      'strUserName': strUserName,
      'strFdate': strFdate,
      'strTdate': strTdate,
      'strBranchid': strBranchid,
    };

    try {

      // final response = await http.post(
      //   Uri.parse(url),
      //   headers: {"Content-Type": "application/json"},
      //   body: json.encode(queryParams),
      // );


      final uri = Uri.parse(url).replace(queryParameters: queryParams);
      final response = await http.post(uri);
      print(uri);

      if (response.statusCode == 200) {


        final jsonData = json.decode(response.body);
        //return DashboardResponse.fromJson(jsonData);

        dashboardInterfaceView.onDashboardData(DashboardResponse.fromJson(jsonData));

        // print("response code"+response.statusCode.toString());
        // final List<dynamic> jsonData = json.decode(response.body);
        //
        // // Parse the JSON data into a list of DashboardData objects
        // List<DashboardResponse> dashboardDataList =
        //     jsonData.map((item) => DashboardData.fromJson(item)).toList();
        //
        // return dashboardDataList;
      } else {
        // Handle non-200 responses
        print('Error: ${response.statusCode}');

        //return null;
      }
    } catch (e) {
      // Handle exceptions
      print('Exception occurred: $e');
      dashboardInterfaceView.onError(""+e.toString());
      //return null;
    }
  }


}