import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String key;
  final String name;
  final String? birthDate;
  final String? topWork;

  const Author({
    required this.key,
    required this.name,
    required this.birthDate,
    this.topWork,
  });

  @override
  List<Object?> get props => [key, name, birthDate, topWork];
}