import 'package:noteapp/model/NoteModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteDatabase {
  static Database? _database;
  NoteDatabase._init();
  static final NoteDatabase instance = NoteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    Database database = await _initDB('notes.db');
    return database;
  }

  Future<Database> _initDB(String dbName) async {
    final pathdb = await getDatabasesPath();
    final path = join(pathdb, dbName);
    // create database
    return openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // creating new table inside database
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const boolType = "BOOLEAN NOT NULL";
    const textType = "TEXT NOT NULL";
    const intergerType = "INTEGER NOT NULL";
    await db.execute('''
      CREATE TABLE $NOTETABLE(  
        ${NoteFiels.id} $idType,
        ${NoteFiels.isImportant} $boolType, 
        ${NoteFiels.title} $textType, 
        ${NoteFiels.description} $textType, 
        ${NoteFiels.time} $textType)
      ''');
  }
  // insert item in data base
  Future<NoteModel> insertData(NoteModel note) async {
    // getting database; in database we have Database and if it's null _initDB will create databse and _initDB return openDatabase where we can get database;
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    try {
      print("note data---------");
      print(note.toJson());
      print("note data end---------");
      final id = await db.insert(NOTETABLE, note.toJson());
      print("insert uccessfully: $id");

      return note.copy(id: id);
    } catch (e) {
      print("data insert failed");
      throw Exception("insert data is faild reason: $e");
    } finally {
      instance.close();
    }
  }

  Future delete(int id) async {
    final db = await instance.database;
    try {
      db.delete(NOTETABLE, where: '${NoteFiels.id} = ?', whereArgs: [id]);
    } catch (e) {
      print("$id data not deleted");
    }
  }

  Future<NoteModel> getNote(int id) async {
    final db = await instance.database;

    try {
      final singleNote = await db.query(NOTETABLE,
          columns: NoteFiels.values,
          where: "${NoteFiels.id} = ?",
          whereArgs: [id]);

      return NoteModel.fromJson(singleNote.first);
    } catch (e) {
      throw Exception("$id read not get for $e");
    }
  }

  Future<List<NoteModel>> getNoteList() async {
    final db = await instance.database;
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');
    try {
      List<Map<String, dynamic>> result =
          await db.query(NOTETABLE, orderBy: "${NoteFiels.time} ASC");
      return result.map((e) => NoteModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("note list not get for $e");
    }
  }

  Future update(NoteModel note) async {
    final db = await instance.database;
    try {
      db.update(NOTETABLE, note.toJson(),
          where: "${NoteFiels.id} = ?", whereArgs: [note.id]);
    } catch (e) {
      throw Exception("$note.id data not update for $e");
    }
  }

  Future close() async {
    // getting Database by calling database
    final db = await instance.database;

    db.close();
  }

}
