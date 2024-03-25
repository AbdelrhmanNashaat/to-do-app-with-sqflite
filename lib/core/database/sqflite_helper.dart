import 'dart:developer';

import 'package:sqflite/sqflite.dart';

import '../../features/home/data/task_model.dart';

class SqfLiteHelper {
  late Database database;
  void initDb() async {
    try {
      database = await openDatabase(
        'tasks.db',
        version: 1,
        onCreate: (db, version) {
          db.execute(
              'CREATE TABLE Tasks(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,note TEXT,date TEXT,startTime TEXT,endTime TEXT,color INTEGER,isCompleted INTEGER)');
        },
      );
    } catch (ex) {
      log(ex.toString());
    }
  }

  Future<List<Map<String, Object?>>> getFromDb() async {
    return await database.rawQuery('SELECT * FROM Tasks');
  }

  Future<int> insertIntoDb({required AddTaskModel model}) async {
    const sql = '''
    INSERT INTO Tasks(title, note, date, startTime, endTime, color, isCompleted)
    VALUES(?, ?, ?, ?, ?, ?, ?)
    ''';
    final values = [
      model.title,
      model.note,
      model.date,
      model.startTime,
      model.endTime,
      model.color,
      model.isCompleted,
    ];

    return await database.rawInsert(sql, values);
  }

  Future<int> updateDb({required int id}) async {
    return await database
        .rawUpdate('UPDATE Tasks SET isCompleted = ? WHERE id = ?', [1, id]);
  }

  Future<int> deleteFromDb({required int id}) async {
    return await database.rawDelete(
      'DELETE FROM Tasks WHERE id = ?',
      [id],
    );
  }
}
