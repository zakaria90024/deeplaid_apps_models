import 'dart:async';
import 'dart:io' as io;
import 'package:deeplaid_apps_models/model/commision_model.dart';
import 'package:deeplaid_apps_models/model/doctor_model.dart';
import 'package:deeplaid_apps_models/model/group_model.dart';
import 'package:deeplaid_apps_models/model/item_model.dart';
import 'package:flutter/cupertino.dart';
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

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    //party or doctor
    await db.execute(
        "CREATE TABLE IF NOT EXISTS $TABLE_DOCTOR_LIST ($ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $MPO TEXT, $DOCTORNAME TEXT, $DOCTORADDRESS TEXT, $DOCTORPHONE TEXT)");

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
  Future<CommissionSlabModel> sqfliteSaveCommision(
      CommissionSlabModel items) async {
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
    return List.generate(result!. length, (i) {
      return DoctorModel.fromMap(result[i]);
    });
  }


  Future<List<Customar>> getProductvsList() async {
    // Assuming 'db' is an already initialized database instance

    var dbClient = await db;

    var result = await dbClient?.rawQuery('SELECT * FROM $TABLE_DOCTOR_LIST');
    // Execute the query to fetch data from the databas

    // Generate the list of Customar instances from the query result
    return List.generate(result!.length, (i) {
      return Customar(result[i]['strCustomerName'].toString() , result[i]['strPhone'].toString());
    });
  }






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
  //
  //
  // Future<List<Employee>> getEmployees() async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME]);
  //   //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
  //   List<Employee> employees = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       employees.add(Employee.fromMap(maps[i]));
  //     }
  //   }
  //   return employees;
  // }

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
