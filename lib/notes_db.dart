import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/notes.dart';

class NotesDatabase {

  NotesDatabase();

  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    db.execute(
      'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, content TEXT, time TEXT)',
    );

  }

  Future<void> insertNote(Notes notes) async {
    // Get a reference to the database.
    final db = await instance.database;
    // Insert the Notes into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same note is inserted twice.
     await db.insert(
      'notes',
      notes.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the notes from the notes table.
  Future<List<Notes>> notes() async {
    // Get a reference to the database.
    final db = await instance.database;

    // Query the table for all The Notes.
    final List<Map<String, dynamic>> maps = await db.query('notes');

    // Convert the List<Map<String, dynamic> into a List<Notes>.
    return List.generate(maps.length, (i) {
      return Notes(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
        time: maps[i]['time'],
      );
    });
  }


  Future<void> updateNotes(Notes notes) async {
    final db = await instance.database;

    await db.update('notes', notes.toMap(), where: 'id = ?',
        // Pass the Notes id as a whereArg to prevent SQL injection.
        whereArgs: [notes.id]);
  }

  Future<void> deleteNotes(int id) async {
    // Get a reference to the database.
    final db = await instance.database;

    // Remove the   Notes from the database.
    await db.delete(
      'notes',
      // Use a `where` clause to delete a specific note.
      where: 'id = ?',
      // Pass the Note's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

}
