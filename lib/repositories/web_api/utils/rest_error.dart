import 'package:json_annotation/json_annotation.dart';

part 'rest_error.g.dart';

@JsonSerializable()
class RestError {
  String? error;

  RestError(this.error);

  factory RestError.fromJson(Map<String, dynamic> json) => _$RestErrorFromJson(json);
  Map<String, dynamic> toJson() => _$RestErrorToJson(this);
}