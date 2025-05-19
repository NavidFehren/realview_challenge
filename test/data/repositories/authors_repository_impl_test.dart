// filepath: /Users/navid/Develop/flutter_test_apps/realview_challenge/realview_challenge/test/data/repositories/authors_repository_impl_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:realview_challenge/core/error/exceptions.dart';
import 'package:realview_challenge/core/error/failures.dart';
import 'package:realview_challenge/data/repositories/authors_repository_impl.dart';
import 'package:realview_challenge/domain/entities/author.dart';
import 'package:realview_challenge/data/models/author_model.dart';

import '../../helpers/test_mocks.mocks.dart';

void main() {
  group('AuthorsRepositoryImpl', () {
    late MockAuthorsRemoteDataSource mockRemoteDataSource;
    late AuthorsRepositoryImpl repository;

    setUp(() {
      mockRemoteDataSource = MockAuthorsRemoteDataSource();
      repository = AuthorsRepositoryImpl(remoteDataSource: mockRemoteDataSource);
    });

    const tQuery = 'Tolkien';
    final tAuthorModels = [
      AuthorModel(
        key: 'OL23919A',
        name: 'J.R.R. Tolkien',
        birthDate: '1892-01-03',
        topWork: 'The Lord of the Rings',
        ratingsAverage: 4.35,
      ),
    ];
    
    final tAuthors = [
      Author(
        key: 'OL23919A',
        name: 'J.R.R. Tolkien',
        birthDate: '1892-01-03',
        topWork: 'The Lord of the Rings',
        ratingsAverage: 4.35,
      ),
    ];

    test(
      'should return domain entities when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.searchAuthors(tQuery))
            .thenAnswer((_) async => tAuthorModels);
        
        // act
        final result = await repository.searchAuthors(tQuery);
        
        // assert
        verify(mockRemoteDataSource.searchAuthors(tQuery));
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected Right, got Left(failure)'),
          (authors) => expect(authors, equals(tAuthors)),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.searchAuthors(tQuery))
            .thenThrow(Exception('Test error'));
        
        // act
        final result = await repository.searchAuthors(tQuery);
        
        // assert
        verify(mockRemoteDataSource.searchAuthors(tQuery));
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Should return a ServerFailure'),
        );
      },
    );

    test(
      'should return request cancelled failure when the call to remote data source is cancelled',
      () async {
        // arrange
        when(mockRemoteDataSource.searchAuthors(tQuery))
            .thenThrow(RequestCancelledException());
        
        // act
        final result = await repository.searchAuthors(tQuery);
        
        // assert
        verify(mockRemoteDataSource.searchAuthors(tQuery));
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<RequestCancelledFailure>()),
          (_) => fail('Should return a RequestCancelledFailure'),
        );
      },
    );
  });
}