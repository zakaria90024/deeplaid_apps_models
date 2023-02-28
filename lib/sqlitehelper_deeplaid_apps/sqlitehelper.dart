import 'dart:async';
import 'dart:io' as io;
import 'package:deeplaid_apps_models/model/doctor_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _db;
  //static const String ID = 'id';
  //static const String NAME = 'name';
  static const String DB_NAME = 'deeplaiddb';
  static const String TABLE_DOCTOR_LIST = 'DOCTOR';


  //for Doctor list table
  static const String ID = "id";
  static const String MPO = "mpo";
  static const String DOCTORNAME = "doctorName";
  static const String DOCTORADDRESS = "doctorAddress";
  static const String DOCTORPHONE = "doctorPhone";



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
    // await db
    //     .execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $NAME TEXT)");
    // private static final String CREATE_DOCTOR_TABLE = " CREATE TABLE " + TABLE_DOCTOR_LIST +
    //
    //     "( " + ID + " INTEGER PRIMARY KEY  AUTOINCREMENT NOT NULL," + MPO + " TEXT ," + DOCTORNAME + " TEXT," + DOCTORADDRESS + " TEXT ," + DOCTORPHONE + " TEXT )";
    //
    //
    await db.execute("CREATE TABLE $TABLE_DOCTOR_LIST ($ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $MPO TEXT, $DOCTORNAME TEXT, $DOCTORADDRESS TEXT, $DOCTORPHONE TEXT)");
  }

  Future<DoctorModel> save(DoctorModel doctors) async {
    var dbClient = await db;
    //doctors.id = await dbClient?.insert(TABLE_DOCTOR_LIST, doctors.toMap());
    doctors.mpo = (await dbClient?.insert(TABLE_DOCTOR_LIST, doctors.toMap())) as String?;
    doctors.strCustomerName = (await dbClient?.insert(TABLE_DOCTOR_LIST, doctors.toMap())) as String?;
    doctors.strPhone = (await dbClient?.insert(TABLE_DOCTOR_LIST, doctors.toMap())) as String?;
    doctors.straddress = (await dbClient?.insert(TABLE_DOCTOR_LIST, doctors.toMap())) as String?;
    return doctors;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }



  Future<List<DoctorModel>> getEmployees() async {
    await db;
    final List<Map<String, Object?>> QueryResult = await _db!.rawQuery('SELECT * FROM $TABLE_DOCTOR_LIST');
    return QueryResult.map((e) => DoctorModel.fromMap(e)).toList();
  }
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
    return await dbClient?.delete(TABLE_DOCTOR_LIST, where: '$MPO = ?', whereArgs: [mpo]);
  }

  Future<int?> update(DoctorModel doctors) async {
    var dbClient = await db;
    return await dbClient?.update(TABLE_DOCTOR_LIST, doctors.toMap(),
        where: '$MPO = ?', whereArgs: [doctors.mpo]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient?.close();
  }
}
