import 'package:floor/floor.dart';
import 'package:mvvm/repositories/storage/entities/storage_user.dart';

@dao
abstract class StorageDao {
  @Query('SELECT * FROM StorageUser')
  Future<List<StorageUser>> findAllUsers();

  @insert
  Future<void> insertUser(StorageUser user);
}