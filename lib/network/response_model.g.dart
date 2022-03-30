// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      subject: json['subject'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      one: One.fromJson(json['1'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      '1': instance.one,
    };

One _$OneFromJson(Map<String, dynamic> json) => One(
      email: json['email'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$OneToJson(One instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
    };
