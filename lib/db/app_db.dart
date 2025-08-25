import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_storage/db/daos/cars_dao.dart';
import 'package:drift_storage/db/tables/cars.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [Cars], daos: [CarsDao])
class AppDb extends _$AppDb {
  AppDb() : super(_oppenDataBase());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) {
      return m.createAll();
    },
  );
}

LazyDatabase _oppenDataBase() {
  return LazyDatabase(() async {
    final dbPath = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbPath.path, 'app_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
