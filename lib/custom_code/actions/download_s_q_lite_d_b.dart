// Automatic FlutterFlow imports
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path_provider/path_provider.dart';

// Import necessary packages
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future downloadSQLiteDB() async {
  // create a copy of local sqlite database and put it to my downloads folder

// Get the path of the local database
  String databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'local_d_b.db');

// Create a copy of the database
  Directory? dir = Directory('/storage/emulated/0/Download');
  if (dir != null) {
    String dlPath = dir.path;

    String backupPath = join(dlPath, 'db_backup.db');
    await File(path).copy(backupPath);
  }
}
