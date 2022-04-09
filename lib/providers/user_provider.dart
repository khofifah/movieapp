import 'dart:core';

import 'package:flutter/material.dart';
import 'package:movieapp/utils/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:sqflite/utils/utils.dart';

class UserProvider extends ChangeNotifier {
  Database db;
  Map dataUser;

  openDB() async {
    db = await openDatabase('movie.db');
    notifyListeners();
  }

  closeDB() async {
    await db.close();
    notifyListeners();
  }

  createUserTable() async {
    if (!db.isOpen) openDB();

    tableExists('user_table').then((value) async {
      if (!value)
        await db
            .execute(
          'CREATE TABLE user_table (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT)',
        )
            .then((value) {
          print('value');
        });
    });

    notifyListeners();
  }

  Future<bool> tableExists(String table) async {
    var count = firstIntValue(
      await db.query('sqlite_master',
          columns: ['COUNT(*)'],
          where: 'type = ? AND name = ?',
          whereArgs: ['table', table]),
    );
    return count > 0;
  }

  Future getDataUser(String email, String password) async {
    List<Map> list = await db.query(
      'user_table',
      columns: ['email'],
      where: 'email = ?',
      whereArgs: [email],
    );

    list.where((e) => e['password'] == password).toList();

    if (list.isNotEmpty) {
      dataUser = list[0];
      await SharedPreferencesHandler().setUserId(dataUser['id']);
    }

    notifyListeners();

    return dataUser;
  }

  insertUser(
    String name,
    String email,
    String password,
  ) async {
    int recordId = await db.insert('user_table', {
      'username': name,
      'email': email,
      'password': password,
    });
    await SharedPreferencesHandler().setUserId(recordId);

    notifyListeners();

    return recordId;
  }

  getUserId() async {
    int userId = await SharedPreferencesHandler().getUserId();
    return userId;
  }
}
