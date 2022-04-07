import 'package:login_signup/app_database.dart';
import 'package:login_signup/user.dart';
import 'package:sqflite/sqflite.dart';

class DbOperations {
  final Database dbase;

  DbOperations(this.dbase);

  Future<void> insertUser(User user) async {
    final db = await AppDatabase().initializeDB();

    await dbase.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    var userOne = User(
        id: DateTime.now().millisecond,
        firstName: "Zee",
        lastName: "Sosu",
        email: "zee.sosu@gmail.com",
        password: 'ZAZUzeh');

    await insertUser(userOne);
  }

  Future<List<User>> users() async {
    final db = await AppDatabase().initializeDB();

    final List<Map<String, dynamic>> maps = await dbase.query('users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        firstName: maps[i]['firstName'],
        lastName: maps[i]['lastName'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }
}
