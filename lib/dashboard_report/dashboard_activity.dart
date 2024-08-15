import 'package:deeplaid_apps_models/service/Services.dart';
import 'package:flutter/material.dart';
import 'package:deeplaid_apps_models/dropdown.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../model/dashboard_model.dart';

class DashboardActivity extends StatefulWidget {
  const DashboardActivity({super.key});

  @override
  State<DashboardActivity> createState() => _DashboardActivityState();
}

class _DashboardActivityState extends State<DashboardActivity>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedBranch;
  final TextEditingController _textFieldControllerFromDate =
      TextEditingController();
  final TextEditingController _textFieldControllerToDate =
      TextEditingController();
  int selectedButtonIndex = 0;
  final _selectedColor = Color(0xff1a73e8);
  String selectedTab = "";
  final _tabs = [
    Tab(text: 'Order'),
    Tab(text: 'Sales'),
    Tab(text: 'Collection'),
    Tab(text: 'Limit'),
    Tab(text: 'Dues'),
  ];

  DashboardResponse? dashboardResponse;

  List<CollectionItem> collectionList = [];
  List<CollectionItem> duesList = [];
  List<CollectionItem> limitList = [];
  List<CollectionItem> orderList = [];
  List<CollectionItem> salesList = [];

  //select date From
  void _selectDateFrom(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _textFieldControllerFromDate.text =
          "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  //select date T
  void _selectDateTo(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _textFieldControllerToDate.text =
          "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
    // dashboardResponse= Services.getDashboardData("Deeplaid", "01-08-2024", "14-08-2024", "0001") as DashboardResponse?;
    //
    // print(dashboardResponse.toString());

    Services.getDashboardData("Deeplaid", "01-08-2024", "14-08-2024", "0001")
        .then((data) {
      setState(() {

        //it's called after callback
        Fluttertoast.showToast(msg: "Called");

        dashboardResponse = data;
        duesList = dashboardResponse!.dues;
        limitList = dashboardResponse!.limit;
        orderList = dashboardResponse!.order;
        salesList = dashboardResponse!.sales;

        if(selectedTab == "Sales"){
          limitList = dashboardResponse!.sales;
          //setInfoListTile(salesList);
        }else if(selectedTab == "Limit"){
          limitList = dashboardResponse!.limit;
        }

      });
    });

    String? s = dashboardResponse?.strStatus;

    // List<LimitItem> d = [];
    // d.add(dashboardResponse!.limit.first );
    //
    print("dsf" + s.toString());

  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    // List of items in our dropdown
    List<String> branches = ['Deeplaid', 'Herbal', 'Sales Center'];

    return Scaffold(
      // appBar: AppBar(
      //
      // backgroundColor: Color(0xFF144A9D),
      //   title: Text("Dashboard",
      //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),), centerTitle: true,
      // ),

      body: Center(
        child: SizedBox(
          height: deviceHight,
          width: deviceWidth,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                ///statusbar
                SizedBox(
                  height: deviceHight * 0.035,
                  width: deviceWidth,
                  child: Container(
                    color: Color(0xFF144A9D),
                  ),
                ),

                ///toolber
                SizedBox(
                  height: deviceHight * 0.075,
                  width: deviceWidth,
                  child: Container(
                    alignment: Alignment.center,
                    color: Color(0xFF144A9D),
                    child: Row(
                      children: [
                        SizedBox(
                          height: deviceHight * 0.075,
                          width: deviceWidth,
                          child: Row(
                            children: [
                              SizedBox(
                                height: deviceHight * 0.065,
                                width: deviceWidth * 0.13,
                                child: Container(
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.arrow_back_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ),
                              SizedBox(
                                height: deviceHight * 0.065,
                                width: deviceWidth * 0.87,
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: 0,
                                        top: 0,
                                        right: deviceWidth * 0.065,
                                        bottom: 0),
                                    alignment: Alignment.center,
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 0,
                                          top: 10,
                                          right: 10,
                                          bottom: 10),
                                      child: Text(
                                        "Dashboard",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  // Container(
                  //   child: Row(
                  //     children: [
                  //       SizedBox(child: Text("sdfsd"),),
                  //       Text("Dashboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  //     ],
                  //   ),
                  //
                  //   alignment: Alignment.center,
                  //   child: Text("Dashboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  //   color: Color(0xFF144A9D),
                  //),
                ),

                ///spinner
                SizedBox(
                  height: deviceHight * 0.130,
                  width: deviceWidth,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 12, top: 16, right: 12, bottom: 0),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 3.0),
                            labelText: 'Select Branch',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedBranch,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              hint: Text(
                                'Select Branch*',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedBranch = newValue!;
                                });
                              },
                              items: <String>[
                                'Deeplaid',
                                'Herbal',
                                'Sales Center'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ///button today month year
                SizedBox(
                  width: deviceWidth,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.30,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              // Get the current date
                              DateTime now = DateTime.now();
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(now);
                              print("Today=" + formattedDate);

                              selectedButtonIndex =
                                  1; // Set the index to 1 when Button 1 is pressed
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: selectedButtonIndex == 1
                                ? Color(0xFF144A9D)
                                : Colors.white,
                            foregroundColor: selectedButtonIndex == 1
                                ? Colors.white
                                : Colors.black,
                            side: BorderSide(
                                color: selectedButtonIndex == 1
                                    ? Color(0xFF144A9D)
                                    : Colors.grey),
                          ),
                          child: Text('Today'),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      SizedBox(
                        width: deviceWidth * 0.30,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              // Get the current date
                              DateTime now = DateTime.now();
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(now);

                              //String[] s = formattedDate.split("-");

                              // Split the formatted date string using '-'
                              List<String> dateParts = formattedDate.split('-');

                              // Output the split parts
                              String dayAndMonth =
                                  dateParts[0]; // This will be "dd=MM"
                              String year = dateParts[1]; // This will be "yyyy"

                              String fullFromThisMonth =
                                  "01-" + dateParts[1] + "-" + dateParts[2];

                              print("From=" +
                                  fullFromThisMonth +
                                  "To=" +
                                  formattedDate);

                              selectedButtonIndex =
                                  2; // Set the index to 2 when Button 2 is pressed
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: selectedButtonIndex == 2
                                ? Color(0xFF144A9D)
                                : Colors.white,
                            foregroundColor: selectedButtonIndex == 2
                                ? Colors.white
                                : Colors.black,
                            side: BorderSide(
                                color: selectedButtonIndex == 2
                                    ? Color(0xFF144A9D)
                                    : Colors.grey),
                          ),
                          child: Text('This Month'),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      SizedBox(
                        width: deviceWidth * 0.30,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              // Get the current date
                              DateTime now = DateTime.now();
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(now);
                              List<String> dateParts = formattedDate.split('-');
                              String fullFromThisMonth =
                                  "01-01" + "-" + dateParts[2];
                              print("From=" +
                                  fullFromThisMonth +
                                  "To=" +
                                  formattedDate);

                              selectedButtonIndex =
                                  3; // Set the index to 3 when Button 3 is pressed
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: selectedButtonIndex == 3
                                ? Color(0xFF144A9D)
                                : Colors.white,
                            foregroundColor: selectedButtonIndex == 3
                                ? Colors.white
                                : Colors.black,
                            side: BorderSide(
                                color: selectedButtonIndex == 3
                                    ? Color(0xFF144A9D)
                                    : Colors.grey),
                          ),
                          child: Text('This Year'),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10),

                ///dialog custom date selection
                SizedBox(
                    width: deviceWidth,
                    child: Container(
                      margin:
                          EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Select Date',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF144A9D)),
                                      ),
                                      SizedBox(height: 16.0),
                                      InputDecorator(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12.0, vertical: 3.0),
                                          labelText: 'From Date',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: TextField(
                                            controller:
                                                _textFieldControllerFromDate,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '10/8/2024',
                                              suffixIcon: IconButton(
                                                icon:
                                                    Icon(Icons.calendar_month),
                                                onPressed: () {
                                                  _selectDateFrom(context);
                                                },
                                              ),
                                            ),
                                            readOnly: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      InputDecorator(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12.0, vertical: 3.0),
                                          labelText: 'To Date',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: TextField(
                                            controller:
                                                _textFieldControllerToDate,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '10/8/2024',
                                              suffixIcon: IconButton(
                                                icon:
                                                    Icon(Icons.calendar_month),
                                                onPressed: () {
                                                  _selectDateTo(context);
                                                },
                                              ),
                                            ),
                                            readOnly: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Color(0xFF144A9D)),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          ElevatedButton(
                                            onPressed: () {
                                              print(
                                                  "User entered: ${_textFieldControllerFromDate.text}");
                                              print(
                                                  "User entered: ${_textFieldControllerToDate.text}");
                                              print(
                                                  "Selected branch: $_selectedBranch");
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFF144A9D),
                                              // Button background color
                                              foregroundColor: Color(
                                                  0xFF144A9D), // Text and icon color
                                              //padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Button padding
                                              //textStyle: TextStyle(fontSize: 18), // Text style
                                            ),
                                            child: Text(
                                              'Search',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Center(
                            child: Text(
                          "+Select Custom Date",
                          style: TextStyle(
                              color: Color(0xFF144A9D),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    )),

                SizedBox(height: 16),
                // // ///tabbar
                SizedBox(
                    height: deviceHight * 0.125,
                    width: deviceWidth,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 12, top: 0, right: 12, bottom: 0),
                          //height: kToolbarHeight - 8.0,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TabBar(
                            
                            onTap: (value) {
                              print("va;ite"+value.toString());

                              value.toString();

                              if(value == 0){
                                setState(() {
                                  selectedTab = "Order";
                                  _listView(selectedTab, dashboardResponse);
                                });

                              }else if(value == 1){
                                setState(() {
                                  selectedTab = "Order";
                                  _listView(selectedTab, dashboardResponse);
                                });
                              }else if(value == 2){
                                setState(() {
                                  selectedTab = "Order";
                                  _listView(selectedTab, dashboardResponse);
                                });
                              }else if(value == 3){
                                setState(() {
                                  selectedTab = "Order";
                                  _listView(selectedTab, dashboardResponse);
                                });
                              }else if(value == 4 ){
                                setState(() {
                                  selectedTab = "Order";
                                  _listView(selectedTab, dashboardResponse);
                                });
                              }


                            },
                            controller: _tabController,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: _selectedColor.withOpacity(0.2),
                              //color: _selectedColor
                            ),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black,
                            tabs: _tabs,
                            

                          ),

                          
                        ),

                      ],
                    )),

                SizedBox(
                    height: 200,
                    width: deviceWidth,
                    child: _listView(selectedTab, dashboardResponse)

                )

                /// Custom Tabular with solid selected bg and transparent tabular bg
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listView(String tabString, DashboardResponse? dashboardResponse){

    List<CollectionItem> list = [];
    if(tabString == "Order"){
      list = dashboardResponse!.order;
    }
    if(tabString == "Sales"){
      list = dashboardResponse!.sales;
    }
    if(tabString == "Collection"){
      list = dashboardResponse!.collection;
    }
    if(tabString == "Limit"){
      list = dashboardResponse!.limit;
    }
    if(tabString == "Dues"){
      list = dashboardResponse!.dues;
    }

    return Container(
      color: Colors.grey.shade50,
      child: list.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return ListTile(
            title: Text(item.strProperty),
            subtitle: Text(
                'Amount: ${item.dblAmount.toString()}'),
          );
        },
      ),
    );
  }




  Widget _buildPage(String text, Color color) {
    return Container(
      child: SizedBox(
        height:50 ,
        child: Container(
          child: Center(
            child: Text(text, style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
        ),
      ),
    );
  }



}
