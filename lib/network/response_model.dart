import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

// @JsonSerializable()

@JsonSerializable()
class ResponseModel {
  String subject;
  @JsonKey(name: 'data')
  final List<Data> data;
  @JsonKey(ignore: true)
  bool isLogged = false;

  ResponseModel({
    required this.subject,
    required this.data,
  }) {
    if (subject == 'Record Found') {
      isLogged = true;
    } else {
      isLogged = false;
    }
  }

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: '1')
  final One one;
  Data({required this.one});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class One {
  String email;
  String name;
  One({required this.email, required this.name});

  factory One.fromJson(Map<String, dynamic> json) => _$OneFromJson(json);
}
