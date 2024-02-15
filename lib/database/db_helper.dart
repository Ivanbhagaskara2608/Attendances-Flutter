import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          user_id TEXT, 
          email TEXT, 
          fullname TEXT, 
          gender TEXT, 
          birthdate TEXT, 
          email_verified_at TEXT, 
          type TEXT, 
          level TEXT, 
          total_created_subject INTEGER, 
          image TEXT, 
          created_at TEXT)""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('attendance.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      print("creating table");
      await createTables(database);
    });
  }

  static Future<int> addUser(User user) async {
    final db = await DBHelper.db();
    final data = {
      'user_id': user.id,
      'email': user.email,
      'fullname': user.fullname,
      'gender': user.gender,
      'birthdate': user.birthdate,
      'email_verified_at': user.emailVerifiedAt,
      'type': user.type,
      'level': user.level,
      'total_created_subject': user.totalCreatedSubject,
      'image': user.image,
      'created_at': user.createdAt
    };
    final id = await db.insert('users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print(data);
    return id;
  }

  static Future<User?> getUser() async {
    final db = await DBHelper.db();
    List<Map<String, dynamic>> result =
        await db.query('users', orderBy: "id", limit: 1);

    if (result.isNotEmpty) {
      return User(
        id: result[0]['user_id'],
        email: result[0]['email'],
        fullname: result[0]['fullname'],
        gender: result[0]['gender'],
        birthdate: result[0]['birthdate'],
        emailVerifiedAt: result[0]['email_verified_at'],
        type: result[0]['type'],
        level: result[0]['level'],
        totalCreatedSubject: result[0]['total_created_subject'],
        image: result[0]['image'],
        createdAt: result[0]['created_at'],
      );
    } else {
      return null;
    }
  }

  static Future<int> updateUser(User user) async {
    final db = await DBHelper.db();

    final data = {
      'user_id': user.id,
      'email': user.email,
      'fullname': user.fullname,
      'gender': user.gender,
      'birthdate': user.birthdate,
      'email_verified_at': user.emailVerifiedAt,
      'type': user.type,
      'level': user.level,
      'total_created_subject': user.totalCreatedSubject,
      'image': user.image,
      'created_at': user.createdAt
    };

    final result = await db
        .update('users', data, where: "user_id = ?", whereArgs: [user.id]);
    return result;
  }

  static Future<void> deleteData() async {
    final db = await DBHelper.db();
    try {
      await db.delete('users');
    } catch (err) {
      debugPrint("Error : $err");
    }
  }
}
