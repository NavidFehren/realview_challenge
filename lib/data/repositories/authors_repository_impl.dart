
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:realview_challenge/core/error/failures.dart';
import 'package:realview_challenge/domain/entities/author.dart';
import 'package:realview_challenge/domain/remote/authors_remote_data_source.dart';
import 'package:realview_challenge/domain/repositories/authors_repository.dart';

@LazySingleton(as: AuthorsRepository)
class AuthorsRepositoryImpl implements AuthorsRepository {
  final AuthorsRemoteDataSource remoteDataSource;

  AuthorsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Author>>> searchAuthors(String query) async {
    try {
      final authors = await remoteDataSource.searchAuthors(query);
      return Right(authors);
    } on Exception {
      return Left(ServerFailure(message: "Failed to search authors"));
    }
  }
}