import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:realview_challenge/domain/entities/author.dart';

import 'package:realview_challenge/domain/usecases/get_authors.dart';
import 'package:realview_challenge/core/error/failures.dart';

import '../../helpers/test_mocks.mocks.dart';

void main() {
  group('GetAuthors', () {
    late MockAuthorsRepository mockAuthorsRepository;
    late GetAuthors usecase;

    setUp(() {
      mockAuthorsRepository = MockAuthorsRepository();
      usecase = GetAuthors(mockAuthorsRepository);
    });

    const tQuery = 'Austen';
    final tAuthors = [
      Author(
        key: 'OL1A',
        name: 'Jane Austen',
        birthDate: '1775-12-16',
        topWork: 'Pride and Prejudice',
        ratingsAverage: 4.3,
      ),
    ];
    final tFailure = ServerFailure(message: '');

    test(
      'should return Right<List<Author>> when repository search succeeds',
      () async {
        when(
          mockAuthorsRepository.searchAuthors(tQuery),
        ).thenAnswer((_) async => Right(tAuthors));
        final result = await usecase.call(tQuery);
        expect(result, Right(tAuthors));
      },
    );

    test('should return Left<Failure> when repository search fails', () async {
      when(
        mockAuthorsRepository.searchAuthors(tQuery),
      ).thenAnswer((_) async => Left(tFailure));
      final result = await usecase.call(tQuery);
      expect(result, Left(tFailure));
    });

    test('should call repository.searchAuthors once', () async {
      when(
        mockAuthorsRepository.searchAuthors(tQuery),
      ).thenAnswer((_) async => Right(tAuthors));
      await usecase.call(tQuery);
      verify(mockAuthorsRepository.searchAuthors(tQuery)).called(1);
      verifyNoMoreInteractions(mockAuthorsRepository);
    });
  });
}
