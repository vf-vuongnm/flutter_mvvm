import 'package:json_annotation/json_annotation.dart';

part 'api_user.g.dart';

@JsonSerializable()
class ApiUser {
  int? id;
  String? email;
  @JsonKey(name:'first_name')
  String? firstName;
  @JsonKey(name:'last_name')
  String? lastName;
  String? avatar;


  ApiUser(this.id, this.email, this.firstName, this.lastName, this.avatar);

  factory ApiUser.fromJson(Map<String, dynamic> json) => _$ApiUserFromJson(json["data"]);
  Map<String, dynamic> toJson() => _$ApiUserToJson(this);
}