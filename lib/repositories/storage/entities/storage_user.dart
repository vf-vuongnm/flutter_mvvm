import 'package:floor/floor.dart';

@entity
class StorageUser {
  @primaryKey
  late final int id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  StorageUser(this.id, this.email, this.firstName, this.lastName, this.avatar);
}