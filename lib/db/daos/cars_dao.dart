import 'package:drift/drift.dart';
import 'package:drift_storage/db/app_db.dart';
import 'package:drift_storage/db/tables/cars.dart';

part 'cars_dao.g.dart';

@DriftAccessor(tables: [Cars])
class CarsDao extends DatabaseAccessor<AppDb> with _$CarsDaoMixin {
  CarsDao(super.db);

  Future<int> inserCar({required String name, required int age}) async {
    return await db
        .into(cars)
        .insert(CarsCompanion(name: Value(name), age: Value(age)));
  }

  Future getAllCars() async {
    return await db.select(cars).get();
  }

  Future deletecar({required int id}) async {
    await (db.delete(cars)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future updateCar({required CarsCompanion car}) async {
    await db.update(cars).replace(car);
  }
}
