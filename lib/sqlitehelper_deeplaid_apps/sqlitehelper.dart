import 'dart:async';
import 'dart:io' as io;
import 'package:deeplaid_apps_models/model/commision_model.dart';
import 'package:deeplaid_apps_models/model/doctor_model.dart';
import 'package:deeplaid_apps_models/model/group_model.dart';
import 'package:deeplaid_apps_models/model/item_model.dart';
import 'package:deeplaid_apps_models/model/login_model.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../model/customar_model.dart';

class DBHelper {
  static Database? _db;
  static const String DB_NAME = 'dbdeeplaid';
  static const String TABLE_DOCTOR_LIST = 'DOCTOR';
  static const String TABLE_GROUP_LIST = "STOCKGROUP";
  static const String TABLE_ITEM_LIST = "STOCKITEM";
  static const String TABLE_COMMISSION_SLAB_LIST = "COMMISSIONSLAB";
  static const String TABLE_LOGIN = "LOGIN";


  // private static final String CREATE_LOGIN_TABLE = " CREATE TABLE IF NOT EXISTS " + TABLE_LOGIN + "(" + USER_LOGIN_SERIAL + " INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, " + USER_LOGIN_ID + " TEXT, " + USER_PASSWORD + " TEXT,"
  //     + USER_NAME + " TEXT," + USERTYPE + " TEXT," + MOBILENO + " TEXT," + SECURITYCODE + " TEXT," + TERITORYCODE + " TEXT," + TERITORYNAME + " TEXT," + UNIQNO + " TEXT," + STATUS + " TEXT)";
  //

  // {
  //   "intMpoType": 0,
  //   //"lngUniqueNo": 500,
  //   "strArea": "AH-AM-Asraful Haque Suhak-Habiganj",
  //   "strCardNo": "M-12495",
  //   "strDivision": "DH-DSM-Mohiuddin Ahmed-Sylhet",
  //
  //   //"strLedgerName": "Md. Sharif Hossain Suhag",
  //   "strMerzeName": "353-Md. Sharif Hossain Suhag-Nasirnagar",
  //   "strMobileNo": "01741784300",
  //   //"strResponse": "Yes",
  //   "strRole": "MPO       ",
  //   "strTeam": "FIGHTER",
  //   "strTeritorryCode": "353",
  //   "strTeritorryName": "Nasirnagar",
  //   //"strUserID": "500",
  //   //"strUserPassword": "353",
  //   "strZone": "EAST ZONE",
  //   "strbranchID": "0001"
  // }

  //for Login list table
  static const String strUserID = "strUserID";
  static const String strLedgerName = "strLedgerName";
  static const String strTeritorryCode = "strTeritorryCode";
  static const String strResponse = "strResponse";
  static const String intMpoType = "intMpoType";
  static const String strCardNo = "strCardNo";
  static const String strArea = "strArea";
  static const String strDivision = "strDivision";
  static const String strMerzeName = "strMerzeName";
  static const String strMobileNo = "strMobileNo";
  static const String strUserPassword = "strUserPassword";
  static const String strRole = "strRole";
  static const String strTeamZone = "strTeamZone";
  static const String strbranchID = "strbranchID";
  static const String strTeritorryName = "strTeritorryName";




  //for Doctor list table
  static const String ID = "id";
  static const String MPO = "mpo";
  static const String DOCTORNAME = "doctorName";
  static const String DOCTORADDRESS = "doctorAddress";
  static const String DOCTORPHONE = "doctorPhone";


  //commission slab
  static const String SLABGROUP = "groupName";
  static const String FROMRANGE = "dblFromRange";
  static const String PERCENTAGE = "dblPercentage";
  static const String TORANGE = "dblToRange";
  static const String STRDATE = "strDate";

  //for Item list table
  static const String commgroupgame = "commgroupgame";
  static const String dblPartyvalue = "dblPartyvalue";
  static const String dblRate = "dblRate";
  static const String dblcomboMaxvalue = "dblcomboMaxvalue";
  static const String dblcomboMinqty = "dblcomboMinqty";
  static const String groupName = "groupName";
  static const String itemName = "itemName";
  static const String itemcode = "itemcode";
  static const String itemdepot = "depot";

  //for Doctor list table
  static const String GROUPNAME = "GroupName";

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  String path = "";

  initDb() async {
    if (kIsWeb) {
      path = "/assets/db";
    } else {
      io.Directory documentsDirectory =
          await getApplicationDocumentsDirectory();
      path = join(documentsDirectory.path, DB_NAME);
    }
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

//   Future<Database> initDb() async {
// //here
//     if (kIsWeb) {
//       String path = "/assets/db";
//     } else {
//       Directory directory = await getApplicationDocumentsDirectory();
//       String path = join(directory.path, 'annonce_database.db');
//     }
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }

  _onCreate(Database db, int version) async {


    //party or doctor
    await db.execute("CREATE TABLE IF NOT EXISTS $TABLE_LOGIN ($strUserID TEXT, $strLedgerName TEXT, $strTeritorryName TEXT, $strResponse TEXT, $strTeritorryCode TEXT, $intMpoType TEXT,  $strCardNo TEXT, $strArea TEXT, $strDivision TEXT, $strMerzeName TEXT, $strMobileNo TEXT, $strUserPassword TEXT, $strRole TEXT, $strTeamZone TEXT, $strbranchID TEXT)");

    //party or doctor
    await db.execute("CREATE TABLE IF NOT EXISTS $TABLE_DOCTOR_LIST ($ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $MPO TEXT, $DOCTORNAME TEXT, $DOCTORADDRESS TEXT, $DOCTORPHONE TEXT)");

    //stock items
    await db.execute(
        "CREATE TABLE IF NOT EXISTS $TABLE_ITEM_LIST ($ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $commgroupgame TEXT, $dblPartyvalue TEXT, $dblRate TEXT, "
        "$dblcomboMaxvalue TEXT, $dblcomboMinqty TEXT, $groupName TEXT, $itemName TEXT, $itemcode TEXT, $itemdepot TEXT)");

    //stockgroup
    await db.execute(
        "CREATE TABLE IF NOT EXISTS $TABLE_GROUP_LIST ($ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $GROUPNAME TEXT )");

    //commisonslab
    await db.execute(
        "CREATE TABLE IF NOT EXISTS $TABLE_COMMISSION_SLAB_LIST ($ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $SLABGROUP TEXT, $FROMRANGE TEXT, $PERCENTAGE TEXT, $TORANGE TEXT, $STRDATE TEXT)");
  }


  //for login table insert update delete =======================================
  Future<LoginModel> loginInfoSave(LoginModel items) async {
    var dbClient = await db;
    await dbClient?.insert(TABLE_LOGIN, items.toMap());
    return items;
  }

  Future<int?> loginUserDelete() async {
    var dbClient = await db;
    int? result = await dbClient?.rawDelete('DELETE FROM $TABLE_LOGIN');
    return result;
  }

  Future<List> getUserInfo() async {
    //Database db = await this.db;

    var dbClient = await db;
    var result = await dbClient?.rawQuery('SELECT * FROM $TABLE_LOGIN');
    //return result;
    return List.generate(result!.length, (i) {
      return DoctorModel.fromMap(result[i]);
    });
  }
  //end for login table insert update delete ===================================




  Future<DoctorModel> sqfliteSaveDoctor(DoctorModel doctors) async {
    var dbClient = await db;
    await dbClient?.insert(TABLE_DOCTOR_LIST, doctors.toMap());
    // doctors.mpo = (await dbClient?.insert(TABLE_DOCTOR_LIST, doctors.toMap())) as String?;
    // doctors.strCustomerName = (await dbClient?.insert(TABLE_DOCTOR_LIST, doctors.toMap())) as String?;
    // doctors.strPhone = (await dbClient?.insert(TABLE_DOCTOR_LIST, doctors.toMap())) as String?;
    // doctors.straddress = (await dbClient?.insert(TABLE_DOCTOR_LIST, doctors.toMap())) as String?;
    // print("${"ckkka"}");
    return doctors;
    /*
     await dbClient?.transaction((txn) async {
       var query = "INSERT INTO $TABLE_DOCTOR_LIST ($MPO, $DOCTORNAME, $DOCTORADDRESS, $DOCTORPHONE) VALUES ('" + doctors.mpo + "')";
       return await txn.rawInsert(query);
    // });*/
  }

  Future<int?> deleteDoctor() async {
    var dbClient = await db;
    int? result = await dbClient?.rawDelete('DELETE FROM $TABLE_DOCTOR_LIST');
    return result;
  }

  //for group sqlite
  Future<GroupModel> sqflitesaveGroup(GroupModel groups) async {
    var dbClient = await db;
    await dbClient?.insert(TABLE_GROUP_LIST, groups.toMap());
    return groups;
  }

  Future<int?> sqlitedeleteGroup() async {
    var dbClient = await db;
    int? result = await dbClient?.rawDelete('DELETE FROM $TABLE_GROUP_LIST');
    return result;
  }


  //for ITEM sqlite
  Future<ItemModel> sqfliteSaveItem(ItemModel items) async {
    var dbClient = await db;
    await dbClient?.insert(TABLE_ITEM_LIST, items.toMap());
    return items;
  }

  Future<int?> sqlitedeleteItem() async {
    var dbClient = await db;
    int? result = await dbClient?.rawDelete('DELETE FROM $TABLE_ITEM_LIST');
    return result;
  }

  //for Commision sqlite
  Future<CommissionSlabModel> sqfliteSaveCommision(CommissionSlabModel items) async {
    var dbClient = await db;
    await dbClient?.insert(TABLE_COMMISSION_SLAB_LIST, items.toMap());
    return items;
  }

  Future<int?> sqlitedeleteCommission() async {
    var dbClient = await db;
    int? result =
        await dbClient?.rawDelete('DELETE FROM $TABLE_COMMISSION_SLAB_LIST');
    return result;
  }

  Future<List> getProductvs() async {
    //Database db = await this.db;

    var dbClient = await db;
    var result = await dbClient?.rawQuery('SELECT * FROM $TABLE_DOCTOR_LIST');
    //return result;
    return List.generate(result!.length, (i) {
      return DoctorModel.fromMap(result[i]);
    });
  }

  // Future<List<Customar>> getProductvsList() async {
  //   // Assuming 'db' is an already initialized database instance
  //
  //   var dbClient = await db;
  //
  //   var result = await dbClient?.rawQuery('SELECT * FROM $TABLE_DOCTOR_LIST');
  //   // Execute the query to fetch data from the databas
  //
  //   // Generate the list of Customar instances from the query result
  //   return List.generate(result!.length, (i) {
  //     return Customar(result[i]['strCustomerName'].toString() , result[i]['strPhone'].toString());
  //   });
  // }

//
//   Future<List> getDoctorsList() async {
//
// //     final curDB = await db;
// //     //query to get all students into a Map list
// //     final List<Map<String, dynamic>> studentMaps = await curDB!.query('$TABLE_DOCTOR_LIST');
// //
// //     //var dbClient = await db;
// //     //
// //     //   var result = await dbClient?.rawQuery('SELECT * FROM $TABLE_DOCTOR_LIST');
// //
// //
// // // Convert the rows into a list of objects
// //     final List<Customar> customers = studentMaps.map((row) {
// //       return Customar(
// //         strCustomerName: row['strCustomerName'].toString(),
// //         strPhone: row['strPhone'].toString(),
// //       );
// //     }).toList();
// //
// //     return customers;
//
//     var dbClient = await db;
//     var result = await dbClient?.rawQuery('SELECT * FROM $TABLE_DOCTOR_LIST');
//     //return result;
//     return List.generate(result!.length, (i) {
//       return DoctorModel.fromMap(result[i]);
//     });
//
//   }

  //  Future<List<Map<String, dynamic>>> getDoctorsList()  async {
  //
  //
  //   final database = await openDatabase('dbdeeplaid.db');
  //   // Query the table for all rows
  //   final List<Map<String, dynamic>> rows = await database.query('TABLE_DOCTOR_LIST');
  //
  //
  //   return rows;
  //
  // }

  // Future<List<Map<String, dynamic>>> getDoctorsList() async {
  //   final curDB = await db;
  //   return await curDB!.query('$TABLE_DOCTOR_LIST');
  // }

  //
  // Future<List<Map<String, dynamic>>> getDoneTodos() async {
  //   //var dbClient = await db;
  //   final db = await openDatabase(DB_NAME);
  //   final List<Map<String, dynamic>> todos = await db.query(TABLE_DOCTOR_LIST, columns: [ID, DOCTORNAME]);
  //   return todos;
  // }
  // Future<List<DoctorModel>> getDoctors() async {
  //
  //   var dbClient = await db;
  //
  //   final List<Map<String, dynamic>> maps = await dbClient!.query(TABLE_DOCTOR_LIST, columns: [ID, DOCTORNAME]);
  //
  //   //final List<Map<String, dynamic>> maps = await dbClient!.query('SELECT * FROM $TABLE_DOCTOR_LIST');
  //   //final List<Map<String, dynamic>> maps = await _database.query(TABLE_DOCTOR_LIST, Matrix4.columns(ID, arg1, arg2, arg3));
  //
  //   List<DoctorModel> employees = [];
  //
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       employees.add(DoctorModel.fromMap(maps[i]));
  //     }
  //   }
  //
  //   // List<DoctorModel> users = [];
  //   // for (Map<String, dynamic> map in maps) {
  //   //   users.add(DoctorModel.fromMap(map));
  //   // }
  //
  //   return employees;
  // }
  // commission slab
  // static const String ID = "id";
  // static const String MPO = "mpo";
  // static const String DOCTORNAME = "doctorName";
  // static const String DOCTORADDRESS = "doctorAddress";
  // static const String DOCTORPHONE = "doctorPhone";

  // Future<List<DoctorModel>> getDoctors() async {
  //   var dbClient? = await db;
  //
  //   List<Map> maps = await dbClient?.query(TABLE_DOCTOR_LIST, columns: [ID,MPO, DOCTORNAME, DOCTORADDRESS, DOCTORPHONE]);
  //   //List<Map> maps = await dbClient?.query(TABLE, columns: [ID, NAME]);
  //   //final List<Map<String, dynamic?>> QueryResult = await _db!.rawQuery('SELECT * FROM $TABLE_DOCTOR_LIST');
  //
  //   List<DoctorModel> users = [];
  //
  //   for (Map<String, dynamic> QueryResult in QueryResults) {
  //     users.add(DoctorModel.fromMap(map));
  //   }
  //
  //   return QueryResult.map((e) => DoctorModel.fromJson(e)).toList();
  // }
  // //
  // //
  // Future<List<Customar>> getEmployees() async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query(TABLE_DOCTOR_LIST, columns: ['strCustomerName', 'strPhone']);
  //   //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
  //   List<Customar> employees = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       employees.add(Customar.fromMap(maps[i]));
  //     }
  //   }
  //   return employees;
  // }

  Future<List<Customar>> getDoctorOrParty() async {
    try {
      var dbClient = await db;
      List<Map<String, dynamic>> maps = await dbClient!.query(
        '$TABLE_DOCTOR_LIST',
        columns: ['doctorName', 'doctorPhone'],
      );

      List<Customar> employees = [];
      if (maps.isNotEmpty) {
        for (var map in maps) {
          employees.add(Customar.fromMap(map));
        }
      }
      return employees;
    } catch (e) {
      print('Error in getEmployees: $e');
      return [];
    }
  }

  //for group name
  Future<List<GroupModel>> getGroups() async {
    try {
      var dbClient = await db;
      List<Map<String, dynamic>> maps = await dbClient!.query(
        '$TABLE_GROUP_LIST',
        columns: ['GroupName'],
      );

      List<GroupModel> employees = [];
      if (maps.isNotEmpty) {
        for (var map in maps) {
          employees.add(GroupModel.fromMap(map));
        }
      }
      return employees;
    } catch (e) {
      print('Error in getEmployees: $e');
      return [];
    }
  }

  //for groupwise products
  Future<List<ItemModel>> getProducts() async {
    try {
      var dbClient = await db;
      List<Map<String, dynamic>> maps = await dbClient!.query(
        '$TABLE_ITEM_LIST',
        columns: [
          'commgroupgame',
          'dblPartyvalue',
          'dblRate',
          'dblcomboMaxvalue',
          'dblcomboMinqty',
          'groupName',
          'itemName',
          'itemcode',
          'depot'
        ],
      );

      List<ItemModel> employees = [];
      if (maps.isNotEmpty) {
        for (var map in maps) {
          employees.add(ItemModel.fromMap(map));
        }
      }
      return employees;
    } catch (e) {
      print('Error in getEmployees: $e');
      return [];
    }
  }

  Future<int?> delete(String mpo) async {
    var dbClient = await db;
    return await dbClient
        ?.delete(TABLE_DOCTOR_LIST, where: '$MPO = ?', whereArgs: [mpo]);
  }

  // Future<int?> update(DoctorModel doctors) async {
  //   var dbClient = await db;
  //   return await dbClient?.update(TABLE_DOCTOR_LIST, doctors.toMap(),
  //       where: '$MPO = ?', whereArgs: [doctors.mpo]);
  // }

  Future close() async {
    var dbClient = await db;
    dbClient?.close();
  }
}
