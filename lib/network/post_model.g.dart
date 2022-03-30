// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      subject: json['subject'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
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
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$OneToJson(One instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
    };
