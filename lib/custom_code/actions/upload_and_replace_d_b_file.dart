// Automatic FlutterFlow imports
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

Future uploadAndReplaceDBFile(FFUploadedFile? dbfile) async {
  // Replace getDatabasesPath local_d_b.db with my dbfile

  String databasesPath = await getDatabasesPath();
  String newPath = join(databasesPath, "local_d_b.db");

  if (dbfile != null) {
    // Replace the old database file with the new one
    Uint8List? dbFileBytes = await dbfile.bytes;

    if (dbFileBytes != null) {
      await deleteFile(File(newPath));
      File file = await File(newPath).create();

      file.writeAsBytesSync(dbFileBytes);
    }
  }
}

Future<void> deleteFile(File file) async {
  try {
    if (await file.exists()) {
      await file.delete();
    }
  } catch (e) {
    // Error in getting access to the file.
  }
}
