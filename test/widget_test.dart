import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshcheck/main.dart';

void main() {
  testWidgets('FreshCheck app starts and displays splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(FreshCheckApp());

    // Verify that FreshCheck title is displayed in splash screen
    expect(find.text('FreshCheck'), findsWidgets);
    expect(find.text('Never let anything expire again'), findsOneWidget);
  });

  testWidgets('Item model correctly calculates days left', (WidgetTester tester) async {
    final item = Item(
      name: 'Test Item',
      expiryDate: DateTime.now().add(Duration(days: 5)),
      category: 'Food',
    );

    expect(item.daysLeft, 5);
  });

  testWidgets('Item status color is correct for expired item', (WidgetTester tester) async {
    final item = Item(
      name: 'Expired Item',
      expiryDate: DateTime.now().subtract(Duration(days: 1)),
      category: 'Food',
    );

    expect(item.statusColor, Colors.red);
    expect(item.statusText, 'Expired!');
  });

  testWidgets('Item status color is correct for expiring soon', (WidgetTester tester) async {
    final item = Item(
      name: 'Expiring Soon',
      expiryDate: DateTime.now().add(Duration(days: 2)),
      category: 'Food',
    );

    expect(item.statusColor, Colors.orange);
  });

  testWidgets('Item icon is correct for category', (WidgetTester tester) async {
    final foodItem = Item(name: 'Apple', expiryDate: DateTime.now().add(Duration(days: 1)), category: 'Food');
    final medicineItem = Item(name: 'Aspirin', expiryDate: DateTime.now().add(Duration(days: 1)), category: 'Medicine');

    expect(foodItem.icon, Icons.fastfood);
    expect(medicineItem.icon, Icons.medical_services);
  });
}
