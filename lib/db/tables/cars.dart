import 'package:drift/drift.dart';

class Cars extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  IntColumn get age => integer().nullable()();
}
