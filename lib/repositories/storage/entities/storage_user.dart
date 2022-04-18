import 'package:realm/realm.dart';

part 'storage_user.g.dart';

@RealmModel()
class _StorageUser {
  @PrimaryKey()
  late final int id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;
}