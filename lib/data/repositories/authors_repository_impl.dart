
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:realview_challenge/core/error/exceptions.dart';
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
      final authorModels = await remoteDataSource.searchAuthors(query);
      final authors = authorModels.map((model) => model.toEntity()).toList();
      
      return Right(authors);
    } on Exception catch (e) {
      if (e is RequestCancelledException) {
        return Left(RequestCancelledFailure());
      }
      return Left(ServerFailure(message: "Failed to search authors: ${e.toString()}"));
    }
  }
}