
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb{

  static Database? _db;

  Future<Database?> get db async{
    if(_db==null){
      _db=await initialDb();
      return _db;
    }else{


      return _db;
    }
  }


  initialDb() async{
    String databasepath=await getDatabasesPath();
    String path=join(databasepath,'t7d.db');
    Database mydb=await openDatabase(path,onCreate: _create , version: 1);
    return mydb;
  }


  _create(Database db, int version) async {
    await db.execute('''
CREATE TABLE "pizza" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" TEXT,  
  "price" INTEGER,  
  "description" TEXT,  
  "img" TEXT
)
  ''');

    await db.execute('''
CREATE TABLE "pizzashoped" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" TEXT,  
  "price" INTEGER,  
  "description" TEXT,  
  "img" TEXT
)
  ''');
  }


  readData(String sql)async{
    Database? mydb=await db;
    List<Map> response =await mydb!.rawQuery(sql);
    return response;
  }
  InsertData(String sql)async{
    Database? mydb=await db;
    int response =await mydb!.rawInsert(sql);
    return response;
  }
  deleteData(String sql) async {
    Database? mydb=await db;
    int response=await mydb!.rawDelete(sql);
    return response;
  }





}