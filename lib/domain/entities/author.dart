import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String key;
  final String name;
  final String? birthDate;

  const Author({
    required this.key,
    required this.name,
    required this.birthDate,
  });

  @override
  List<Object?> get props => [key, name, birthDate];
}