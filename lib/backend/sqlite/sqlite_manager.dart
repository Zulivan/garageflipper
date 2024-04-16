import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'local_d_b',
      'database.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetAllItemsRow>> getAllItems() => performGetAllItems(
        _database,
      );

  Future<List<GetItemRow>> getItem({
    int? id,
  }) =>
      performGetItem(
        _database,
        id: id,
      );

  Future<List<GetSalesDatesRow>> getSalesDates() => performGetSalesDates(
        _database,
      );

  Future<List<GetSalesForDateRow>> getSalesForDate({
    String? date,
  }) =>
      performGetSalesForDate(
        _database,
        date: date,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addItem({
    String? name,
    String? description,
    int? quantity,
    double? buyprice,
  }) =>
      performAddItem(
        _database,
        name: name,
        description: description,
        quantity: quantity,
        buyprice: buyprice,
      );

  Future updateItemInfo({
    String? description,
    int? quantity,
    double? buyprice,
    int? id,
  }) =>
      performUpdateItemInfo(
        _database,
        description: description,
        quantity: quantity,
        buyprice: buyprice,
        id: id,
      );

  Future sellItem1({
    int? quantity,
    int? id,
    int? quantityLeft,
    double? unitprice,
    String? description,
  }) =>
      performSellItem1(
        _database,
        quantity: quantity,
        id: id,
        quantityLeft: quantityLeft,
        unitprice: unitprice,
        description: description,
      );

  Future sellItem({
    int? quantity,
    int? id,
    int? quantityLeft,
    double? unitprice,
  }) =>
      performSellItem(
        _database,
        quantity: quantity,
        id: id,
        quantityLeft: quantityLeft,
        unitprice: unitprice,
      );

  Future deleteSale({
    int? id,
  }) =>
      performDeleteSale(
        _database,
        id: id,
      );

  /// END UPDATE QUERY CALLS
}
