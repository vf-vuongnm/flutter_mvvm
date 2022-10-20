import 'package:floor/floor.dart';
import 'package:mvvm/repositories/storage/database/storage_dao.dart';
import 'package:mvvm/repositories/storage/entities/storage_user.dart';

// Imports for auto generator
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart';

@Database(version: 1, entities: [StorageUser,])
abstract class AppDatabase extends FloorDatabase {
  StorageDao get storageDao;

  Future<void> clearAllTables() async {
    await database.execute('DELETE FROM StorageUser');
  }
}