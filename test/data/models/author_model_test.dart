import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:realview_challenge/data/models/author_model.dart';
import 'package:realview_challenge/domain/entities/author.dart';

void main() {
  group('AuthorModel', () {
    const tAuthorJsonString = '''{
      "key": "OL14420725A",
      "name": "J. K. Rowling",
      "birth_date": "1965-07-31",
      "top_work": "Harry Potter and the Philosopher's Stone",
      "ratings_average": 4.5
    }''';

    final Map<String, dynamic> tAuthorJson = json.decode(tAuthorJsonString);

    const tAuthorModelA = AuthorModel(
      key: 'OL14420725A',
      name: 'J. K. Rowling',
      birthDate: '1965-07-31',
      topWork: 'Harry Potter and the Philosopher\'s Stone',
      ratingsAverage: 4.5,
    );

    const tAuthorModelB = AuthorModel(
      key: 'OL144433',
      name: 'Sebastian Fitzek',
      birthDate: '1971-10-10',
      topWork: 'Der Augensammler',
      ratingsAverage: 4.1,
    );

    const tAuthorModelC = AuthorModel(
      key: 'OL14420725A',
      name: 'J. K. Rowling',
      birthDate: '1965-07-31',
      topWork: 'Harry Potter and the Philosopher\'s Stone',
      ratingsAverage: 4.5,
    );

    const tAuthorA = Author(
      key: 'OL14420725A',
      name: 'J. K. Rowling',
      birthDate: '1965-07-31',
      topWork: 'Harry Potter and the Philosopher\'s Stone',
      ratingsAverage: 4.5,
    );

    test('should be a subclass of Author entity', () {
      // assert
      expect(tAuthorModelA, isA<Author>());
    });
    test(
      'should not be equal to another AuthorModel with different properties',
      () {
        // assert
        expect(tAuthorModelA, isNot(equals(tAuthorModelB)));
      },
    );
    test('should be equal to another AuthorModel with same properties', () {
      // assert
      expect(tAuthorModelA, equals(tAuthorModelC));
    });

    test('fromJson should return a valid model', () {
      // act
      final result = AuthorModel.fromJson(tAuthorJson);

      // assert
      expect(result, equals(tAuthorModelA));
    });
    test('toJson should return a JSON map containing proper data', () {
      // act
      final result = tAuthorModelA.toJson();

      // assert
      expect(result, tAuthorJson);
    });
    test('should extend the author entity', () {
      // assert
      expect(tAuthorModelA, isA<Author>());
    });
    test('toEntity should return a valid entity', () {
      // act
      final result = tAuthorModelA.toEntity();

      // assert
      expect(result, equals(tAuthorA));
    });
    test('fromEntity should return a valid model', () {
      // act
      final result = AuthorModel.fromEntity(tAuthorA);

      // assert
      expect(result, equals(tAuthorModelA));
    });
  });
}
