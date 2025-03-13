import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:realview_challenge/core/error/failures.dart';
import 'package:realview_challenge/domain/entities/author.dart';
import 'package:realview_challenge/domain/repositories/authors_repository.dart';

@injectable
class GetAuthors {
  final AuthorsRepository _authorsRepository;

  GetAuthors(this._authorsRepository);

  Future<Either<Failure, List<Author>>> call(String query) async {
    return await _authorsRepository.searchAuthors(query);
  }
}