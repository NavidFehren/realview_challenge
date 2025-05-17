import 'package:json_annotation/json_annotation.dart';
import 'package:realview_challenge/domain/entities/author.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel extends Author {
  @JsonKey(name: 'key')
  final String key;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'birth_date')
  final String? birthDate;

  @JsonKey(name: 'top_work')
  final String? topWork;

  @JsonKey(name: 'ratings_average')
  final double ratingsAverage;

  const AuthorModel({
    required this.key,
    required this.name,
    required this.birthDate,
    required this.topWork,
    required this.ratingsAverage,
  }) : super(key: key, name: name, birthDate: birthDate, topWork: topWork, ratingsAverage: ratingsAverage);

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}
