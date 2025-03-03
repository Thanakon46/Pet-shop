import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:petshop/main.dart';

void main() {
  testWidgets('Add entity test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PetShopApp());

    // Verify that the list starts empty.
    expect(find.byType(ListTile), findsNothing);

    // Tap the FloatingActionButton to navigate to AddPage.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Enter text into the name field.
    await tester.enterText(find.byType(TextFormField).first, 'Buddy');

    // Enter a number.
    await tester.enterText(find.byType(TextFormField).last, '3');

    // Select a category.
    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Dog').last);
    await tester.pumpAndSettle();

    // Select a date.
    await tester.tap(find.byType(ListTile).first); // Tap on the date selection.
    await tester.pumpAndSettle();
    await tester.tap(find.text('15').first); // Select a date (e.g., the 15th).
    await tester.pumpAndSettle();

    // Submit the form.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that the new entity appears in the list with all information.
    expect(find.text('Buddy'), findsOneWidget);  // Verify name
    expect(find.text('Number: 3'), findsOneWidget);  // Verify number
    expect(find.text('Date: 2025-03-15'), findsOneWidget);  // Verify selected date
    expect(find.text('Category: Dog'), findsOneWidget);  // Verify category
  });
}
