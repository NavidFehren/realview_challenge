// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) => AuthorModel(
  key: json['key'] as String,
  name: json['name'] as String,
  birthDate: json['birth_date'] as String?,
  topWork: json['top_work'] as String?,
  ratingsAverage: (json['ratings_average'] as num).toDouble(),
);

Map<String, dynamic> _$AuthorModelToJson(AuthorModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'birth_date': instance.birthDate,
      'top_work': instance.topWork,
      'ratings_average': instance.ratingsAverage,
    };
