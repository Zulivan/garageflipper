import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GET ALL ITEMS
Future<List<GetAllItemsRow>> performGetAllItems(
  Database database,
) {
  const query = '''
SELECT * FROM items;
''';
  return _readQuery(database, query, (d) => GetAllItemsRow(d));
}

class GetAllItemsRow extends SqliteRow {
  GetAllItemsRow(super.data);

  String? get name => data['name'] as String?;
  String? get description => data['description'] as String?;
  double? get buyprice => data['buyprice'] as double?;
  int? get quantity => data['quantity'] as int?;
  double? get expectedsellprice => data['expectedsellprice'] as double?;
  int? get id => data['id'] as int?;
}

/// END GET ALL ITEMS

/// BEGIN GET ITEM
Future<List<GetItemRow>> performGetItem(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT * FROM items WHERE id = $id;
''';
  return _readQuery(database, query, (d) => GetItemRow(d));
}

class GetItemRow extends SqliteRow {
  GetItemRow(super.data);

  String? get name => data['name'] as String?;
  double? get buyprice => data['buyprice'] as double?;
  String? get description => data['description'] as String?;
  double? get expectedsellprice => data['expectedsellprice'] as double?;
  int? get quantity => data['quantity'] as int?;
}

/// END GET ITEM

/// BEGIN GET SALES DATES
Future<List<GetSalesDatesRow>> performGetSalesDates(
  Database database,
) {
  const query = '''
SELECT 
    sales.date,
    SUM((sales.unitprice * sales.quantity) - (items.buyPrice * sales.quantity)) AS totalprofit
FROM sales
INNER JOIN items ON sales.item = items.id
GROUP BY sales.date;

''';
  return _readQuery(database, query, (d) => GetSalesDatesRow(d));
}

class GetSalesDatesRow extends SqliteRow {
  GetSalesDatesRow(super.data);

  String get date => data['date'] as String;
  double? get totalprofit => data['totalprofit'] as double?;
}

/// END GET SALES DATES

/// BEGIN GET SALES FOR DATE
Future<List<GetSalesForDateRow>> performGetSalesForDate(
  Database database, {
  String? date,
}) {
  final query = '''
SELECT 
    sales.*,
    items.name AS itemname,
    ((sales.unitprice * sales.quantity) - (items.buyprice * sales.quantity)) AS profit,
    SUM(items.buyPrice * sales.quantity - (sales.unitprice * sales.quantity)) OVER () AS totalprofit
FROM sales
INNER JOIN items ON sales.item = items.id
WHERE sales.date = '$date';
''';
  return _readQuery(database, query, (d) => GetSalesForDateRow(d));
}

class GetSalesForDateRow extends SqliteRow {
  GetSalesForDateRow(super.data);

  int get id => data['id'] as int;
  int get item => data['item'] as int;
  int? get quantity => data['quantity'] as int?;
  double? get unitprice => data['unitprice'] as double?;
  String? get date => data['date'] as String?;
  String? get itemname => data['itemname'] as String?;
  double? get profit => data['profit'] as double?;
  double? get totalprofit => data['totalprofit'] as double?;
  String? get description => data['description'] as String?;
}

/// END GET SALES FOR DATE
