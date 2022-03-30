import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

// @JsonSerializable()
@JsonSerializable()
class PostModel {
  String subject;
  @JsonKey(name: 'data')
  final Data data;
  @JsonKey(ignore: true)
  bool isLogged = false;

  PostModel({
    required this.subject,
    required this.data,
  }) {
    if (subject == 'Record Found') {
      isLogged = true;
    } else {
      isLogged = false;
    }
  }

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
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
  String? email;
  String? name;
  String? phone;
  One({required this.email, required this.name, required this.phone});

  factory One.fromJson(Map<String, dynamic> json) => _$OneFromJson(json);
}
