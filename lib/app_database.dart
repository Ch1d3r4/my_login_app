import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database> initializeDB() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'my_app.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT, password TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }
}
