import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:realview_challenge/presentation/widgets/star_rating.dart';

void main() {
  group('StarRating', () {
    testWidgets('should display star icon and rating text', (WidgetTester tester) async {
      // Given a rating string
      const rating = '4.5';
      
      // When creating and rendering the StarRating widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: StarRating(rating: rating),
          ),
        ),
      );
      
      // Then it should display a star icon
      expect(find.byIcon(Icons.star), findsOneWidget);
      
      // And it should display the correct rating text
      expect(find.text(rating), findsOneWidget);
    });
    testWidgets('golden test - should match the golden file', (WidgetTester tester) async {
      // Given a rating string
      const rating = '4.5';
      
      // When creating and rendering the StarRating widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: StarRating(rating: rating),
              ),
            ),
          ),
        ),
      );
      
      // Then it should match the golden file
      await expectLater(
        find.byType(StarRating),
        matchesGoldenFile('golden/star_rating_4.5.png'),
      );
    });
  });
}
