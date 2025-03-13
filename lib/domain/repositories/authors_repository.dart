import 'package:dartz/dartz.dart';
import 'package:realview_challenge/core/error/failures.dart';
import 'package:realview_challenge/domain/entities/author.dart';


abstract class AuthorsRepository {
  /// Searches for authors based on the query
  Future<Either<Failure, List<Author>>> searchAuthors(String query);
}