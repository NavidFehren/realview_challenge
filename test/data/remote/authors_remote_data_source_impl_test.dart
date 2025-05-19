import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:realview_challenge/core/error/exceptions.dart';
import 'package:realview_challenge/data/models/author_model.dart';
import 'package:realview_challenge/data/remote/authors_remote_data_source_impl.dart';

import '../../helpers/test_mocks.mocks.dart';

void main() {
  group('AuthorsRemoteDataSourceImpl', () {
    late AuthorsRemoteDataSourceImpl dataSource;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      dataSource = AuthorsRemoteDataSourceImpl(dio: mockDio);
    });

    const tQuery = 'Tolkien';
    final tResponse = {
      'docs': [
        {
          'key': '/authors/OL23919A',
          'name': 'J.R.R. Tolkien',
          'birth_date': '1892-01-03',
          'top_work': 'The Lord of the Rings',
          'ratings_average': 4.35,
        },
        {
          'key': '/authors/OL2623599A',
          'name': 'Christopher Tolkien',
          'birth_date': '1924-11-21',
          'top_work': 'The Silmarillion',
          'ratings_average': 4.2,
        }
      ]
    };

    final tAuthors = [
      AuthorModel(
        key: '/authors/OL23919A',
        name: 'J.R.R. Tolkien',
        birthDate: '1892-01-03',
        topWork: 'The Lord of the Rings',
        ratingsAverage: 4.35,
      ),
      AuthorModel(
        key: '/authors/OL2623599A',
        name: 'Christopher Tolkien',
        birthDate: '1924-11-21',
        topWork: 'The Silmarillion',
        ratingsAverage: 4.2,
      ),
    ];
    test(
      'should perform a GET request to search for authors with the given query',
      () async {
        // arrange
        final response = Response(
          data: tResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        );
        when(mockDio.get(
          'https://openlibrary.org/search/authors.json',
          queryParameters: {'q': tQuery},
          cancelToken: anyNamed('cancelToken'),
        )).thenAnswer((_) async => response);

        // act
        await dataSource.searchAuthors(tQuery);

        // assert
        verify(mockDio.get(
          'https://openlibrary.org/search/authors.json',
          queryParameters: {'q': tQuery},
          cancelToken: anyNamed('cancelToken'),
        ));
      },
    );

    test(
      'should return a list of AuthorModel when the response code is 200',
      () async {
        // arrange
        final response = Response(
          data: tResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        );
        when(mockDio.get(
          'https://openlibrary.org/search/authors.json',
          queryParameters: {'q': tQuery},
          cancelToken: anyNamed('cancelToken'),
        )).thenAnswer((_) async => response);

        // act
        final result = await dataSource.searchAuthors(tQuery);

        // assert
        expect(result.length, equals(2));
        expect(result, equals(tAuthors));
      },
    );
    test(
      'should throw an Exception when the response code is not 200',
      () async {
        // arrange
        final response = Response(
          data: {'error': 'Error message'},
          statusCode: 404,
          requestOptions: RequestOptions(path: ''),
        );
        when(mockDio.get(
          'https://openlibrary.org/search/authors.json',
          queryParameters: {'q': tQuery},
          cancelToken: anyNamed('cancelToken'),
        )).thenAnswer((_) async => response);

        // act
        final call = dataSource.searchAuthors;

        // assert
        expect(() => call(tQuery), throwsA(isA<Exception>()));
      },
    );
    test(
      'should throw a RequestCancelledException when the request is canceled',
      () async {
        // arrange
        when(mockDio.get(
          'https://openlibrary.org/search/authors.json',
          queryParameters: {'q': tQuery},
          cancelToken: anyNamed('cancelToken'),
        )).thenThrow(
          DioException(
            type: DioExceptionType.cancel,
            error: 'Request canceled',
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // act
        final call = dataSource.searchAuthors;

        // assert
        expect(() => call(tQuery), throwsA(isA<RequestCancelledException>()));
      },
    );
    test(
      'should throw an Exception when a general DioException occurs',
      () async {
        // arrange
        when(mockDio.get(
          'https://openlibrary.org/search/authors.json',
          queryParameters: {'q': tQuery},
          cancelToken: anyNamed('cancelToken'),
        )).thenThrow(
          DioException(
            type: DioExceptionType.connectionTimeout,
            error: 'Connection timeout',
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // act
        final call = dataSource.searchAuthors;

        // assert
        expect(() => call(tQuery), throwsA(isA<Exception>()));
      },
    );

  });
}
