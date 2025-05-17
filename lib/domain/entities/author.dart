import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Author extends Equatable {
  final String key;
  final String name;
  final String? birthDate;
  final String? topWork;
  final double ratingsAverage;

  const Author({
    required this.key,
    required this.name,
    this.birthDate,
    this.topWork,
    required this.ratingsAverage,
  });

  /// The formatted ratings average
  String get formattedRatingsAverage {
    return NumberFormat("0.0").format(ratingsAverage);
  }

  @override
  List<Object?> get props => [key, name, birthDate, topWork, ratingsAverage];
}