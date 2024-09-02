// ignore_for_file: avoid_print

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tut_app/constants/constants.dart';

//!================ Some Clarifications about SQL Database ================
//! =============== ==========// SQL Structure //========= ================
//? ====>> Database ===> Collection of Tables that store data
//?        ==> Each Table ===> Collection of data  organized in columns and rows
//?        ==> Each Row (record)===> Represents a single data item.
//?        ==> Each Column (field) ===> Represents a property included in the data item(Row).
//
//! =============== ==========// SQL Concepts //========= ================
//? Primary key ==> is a unique identifier for each row in a table.
//? Foreign key ==> is a column (or set of columns) in one table that references the primary key of another table.
//? Index ==> is a performance optimization structure that allows faster querying of data in a table.
//?           Indexes are created on columns to improve the speed of data retrieval operations.
//? Query ==> is a request for data or an action in SQL.

class BooksSqlDatabase {
  ///this getter to ensure that one data base instance is created
  ///because we will call the same instance in any all CRUD operations
  static Database? _db;
  Future<Database?> get _initDB async {
    if (_db == null) {
      _db = await initializeDataBase();
      return _db;
    }
    return _db;
  }

  Future<Database> initializeDataBase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'books.db');

    /// join method merges db path with it's name
    Database historyDB = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return historyDB;
  }

  /// create data base tables
  /// this method called once when data base is initialized
  _onCreate(Database db, int version) async {
    /// we added ''' at first and end of the sql order to enable multi-lines writing for sql code
    ///execute method takes Sql code (has it's own syntax)

    Batch dbBatch = db.batch();
    dbBatch.execute('''
  CREATE TABLE "${AppConstants.sqlKeys.savedBooksTable}"(
    "${AppConstants.sqlKeys.bookId}" TEXT NOT NULL PRIMARY KEY,
    "${AppConstants.sqlKeys.bookName}" TEXT NOT NULL,
    "${AppConstants.sqlKeys.bookImage}" BLOB
  )
''');

//     dbBatch.execute('''
//   CREATE TABLE "$downloadsTable"(
//     "id" INTEGER NOT NULL,
//     "date" TEXT NOT NULL,
//     "done" INTEGER NOT NULL
//   )
// ''');
    await dbBatch.commit();
    print('_onCreate function called to created data base table===========');
  }

  ///called when there is an update on the data base tables(Structure)
  _onUpgrade(Database db, int newVersion, int oldVersion) async {
    print(
        'onUpdate ========== function called to update data base table===========');
  }

  ///=================================
  ///========CRUD operations==========
  ///=================================

  ///Create
  Future<int> createData(
      {required String tableName, required Map<String, Object?> values}) async {
    Database? mydb = await _initDB;
    int response = await mydb!.insert(tableName, values);
    print('**************************************Create sql::: $response');
    return response;

    ///
    //! In case you need to store data with Sql command uncomment this.
    //! and pass the sql command as String.
    // int response = await mydb!.rawInsert(sql);
    // print('**************************************Create sql::: $response');
    // return response;
  }

  ///Read
  Future<List<Map>> readData({
    required String tableName,
  }) async {
    Database? mydb = await _initDB;
    final List<Map> response = await mydb!.query(
      tableName,
    );
    return response;
    //! In case you need to store data with Sql command uncomment this.
    // List<Map<String, dynamic>> response = await mydb!.rawQuery(sql);
    // print(
    //     '******************************************response from db:: $response');
    // return response;
  }

  ///Update
  Future<int> updateData(String sql) async {
    Database? mydb = await _initDB;
    int response = await mydb!.rawUpdate(sql);
    print('update db:::: res: $response');
    return response;
  }

  ///Delete
  Future<int> deleteData(
      {required String tableName, required String id}) async {
    Database? mydb = await _initDB;
    int response = await mydb!.delete(
      tableName,

      /// This is the condition which delete will apply on
      where: '${AppConstants.sqlKeys.bookId} = ?',

      /// This arg will be passed to the where condition.
      whereArgs: [id],
    );
    print('Delete response $response');
    return response;
  }

  ///Delete the whole data base
  deleteCompleteDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'habits_record.db');
    await deleteDatabase(dbPath);
  }

  ///=================================
  ///=========Query process==========
  ///=================================

  Future<int> getLastInsertRowId() async {
    Database? mydb = await _initDB;
    int lastId = await mydb!
        .rawQuery('SELECT last_insert_rowid();')
        .then((result) => result.first.values.first as int);
    return lastId;
  }
}
