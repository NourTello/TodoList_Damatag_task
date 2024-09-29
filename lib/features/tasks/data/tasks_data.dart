import 'package:sqflite/sqflite.dart';

import '../domain/models/task_model.dart';

class TasksData {
  late Database database;

  // open the database
  Future openDataBase() async {
    database = await openDatabase('todo_list.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, description TEXT, status INTEGER DEFAULT 0)').then((value) => print("dataBase created "));
    },
    onOpen: (db)=>print("dataBase opened")
    );

  }
  Future addTask({
    required String title,
    required String description,
  }) async {
    try {
      await database.transaction((txn) async {
        int id1 = await txn.rawInsert(
            'INSERT INTO Tasks (title, description) VALUES(?, ?)',
            [title, description]); // Use placeholders and pass the values
        print('Inserted task with id: $id1');
      });
    } catch (error) {
      throw Exception('Error inserting task: $error');
    }
  }


  Future ChangeTaskStatus(int taskId) async {
    try {
      // First, fetch the current status of the task
      List<Map<String, dynamic>> result = await database.query(
        'Tasks',
        columns: ['status'],
        where: 'id = ?',
        whereArgs: [taskId],
      );

      if (result.isNotEmpty) {
        int currentStatus =
            result[0]['status']; // Get the current status (0 or 1)

        // Toggle the status: If it's 0, set to 1. If it's 1, set to 0.
        int newStatus = currentStatus == 0 ? 1 : 0;

        // Update the task's status in the database
        await database.update(
          'Tasks',
          {'status': newStatus}, // The new status to update
          where: 'id = ?',
          whereArgs: [taskId],
        );

        print('Task with id $taskId updated to status: $newStatus');
      } else {
        throw Exception('Error toggling task status');
      }
    } catch (error) {
      throw Exception('Error toggling task status: $error');
    }
  }

  Future deleteTask({required int id}) async {
    try {
      await database.delete(
        'Tasks', // Table name
        where: 'id = ?', // The condition to specify the row to delete
        whereArgs: [
          id
        ], // The argument to replace the '?' in the 'where' clause
      );
      print('Task with id $id deleted');
    } catch (error) {
      throw Exception('Error deleting task: $error');
    }
  }
  Future<List<Task>> getTasks() async {
    try {
      // Query the database for all tasks
      final List<Map<String, dynamic>> maps = await database.query('Tasks');

      // Convert the List<Map<String, dynamic>> into a List<Task>
      List<Task> tasksList = maps.map((taskMap) => Task.fromMap(taskMap)).toList();

      print('Fetched tasks: $tasksList');
      return tasksList; // Return the list of tasks
    } catch (error) {
      throw Exception('Error fetching tasks: $error');
    }
  }

}
