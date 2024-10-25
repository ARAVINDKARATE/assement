import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assement/domain/entities/apod_entity.dart';
import 'package:assement/presentation/widgets/apod_image_widget.dart';

void main() {
  testWidgets('ApodImageWidget displays image, title, and explanation', (WidgetTester tester) async {
    // Arrange
    final apodEntity = ApodEntity(
      title: 'Test Title',
      explanation: 'Test Explanation',
      url: 'https://example.com/image.jpg',
      date: '2024-10-25',
    );

    // Act
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ApodImageWidget(apod: apodEntity),
      ),
    ));

    // Assert
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Explanation'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
