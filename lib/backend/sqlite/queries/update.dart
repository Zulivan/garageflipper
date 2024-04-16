import 'package:sqflite/sqflite.dart';

/// BEGIN ADD ITEM
Future performAddItem(
  Database database, {
  String? name,
  String? description,
  int? quantity,
  double? buyprice,
}) {
  final query = '''
INSERT INTO items (name, description, quantity, buyprice, expectedsellprice)
VALUES ('$name', '$description', $quantity, $buyprice, 0);
''';
  return database.rawQuery(query);
}

/// END ADD ITEM

/// BEGIN UPDATE ITEM INFO
Future performUpdateItemInfo(
  Database database, {
  String? description,
  int? quantity,
  double? buyprice,
  int? id,
}) {
  final query = '''
UPDATE items
SET description = '$description', quantity = $quantity, buyprice = $buyprice
WHERE id = $id;
''';
  return database.rawQuery(query);
}

/// END UPDATE ITEM INFO

/// BEGIN SELL ITEM 1
Future performSellItem1(
  Database database, {
  int? quantity,
  int? id,
  int? quantityLeft,
  double? unitprice,
  String? description,
}) {
  final query = '''
INSERT INTO sales (item, quantity, unitprice, date, description) VALUES ($id, $quantity, $unitprice, DATE('now'), '$description');
''';
  return database.rawQuery(query);
}

/// END SELL ITEM 1

/// BEGIN SELL ITEM
Future performSellItem(
  Database database, {
  int? quantity,
  int? id,
  int? quantityLeft,
  double? unitprice,
}) {
  final query = '''
 UPDATE items SET quantity = $quantityLeft WHERE id = $id;
''';
  return database.rawQuery(query);
}

/// END SELL ITEM

/// BEGIN DELETE SALE
Future performDeleteSale(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM sales WHERE id = $id;
''';
  return database.rawQuery(query);
}

/// END DELETE SALE
