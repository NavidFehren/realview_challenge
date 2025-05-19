import 'package:flutter_test/flutter_test.dart';
import 'package:realview_challenge/domain/entities/author.dart';

void main() {
  group('Author', () {
    const tAuthorA = Author(
      key: 'OL14420725A',
      name: 'J. K. Rowling',
      birthDate: '1965-07-31',
      topWork: 'Harry Potter and the Philosopher\'s Stone',
      ratingsAverage: 4.5,
    );

    const tAuthorB = Author(
      key: 'OL144433',
      name: 'Sebastian Fitzek',
      birthDate: '1971-10-10',
      topWork: 'Der Augensammler',
      ratingsAverage: 4.1,
    );

    const tAuthorC = Author(
      key: 'OL14420725A',
      name: 'J. K. Rowling',
      birthDate: '1965-07-31',
      topWork: 'Harry Potter and the Philosopher\'s Stone',
      ratingsAverage: 4.5,
    );

    test('should not be equal to another Author with different properties', () {
      // assert
      expect(tAuthorA, isNot(equals(tAuthorB)));
    });
    test('should be equal to another Author with same properties', () {
      // assert
      expect(tAuthorA, equals(tAuthorC));
    });
    test('formattedRatingsAverage should return properly formatted rating', () {
      // arrange
      const expectedFormattedRating = '4.5';
      
      // act
      final result = tAuthorA.formattedRatingsAverage;
      
      // assert
      expect(result, equals(expectedFormattedRating));
    });
    test('formattedRatingsAverage should round to one decimal place', () {
      // arrange
      const author = Author(
        key: 'OL123456',
        name: 'George Orwell',
        birthDate: '1903-06-25',
        topWork: 'A good book',
        ratingsAverage: 4.23,
      );
      const expectedFormattedRating = '4.2';
      
      // act
      final result = author.formattedRatingsAverage;
      
      // assert
      expect(result, equals(expectedFormattedRating));
    });
  });
}