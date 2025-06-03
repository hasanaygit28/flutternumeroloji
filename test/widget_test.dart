import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:numeroloji4/main.dart';

void main() {
  testWidgets('Numeroloji uygulaması form testleri', (WidgetTester tester) async {

    await tester.pumpWidget(NumerologyApp());

    await tester.enterText(find.byType(TextFormField).at(0), 'Ali');
    await tester.enterText(find.byType(TextFormField).at(1), 'Vural');
    await tester.enterText(find.byType(TextFormField).at(2), '15.08.1992');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.textContaining('Yaşam Yolu Sayısı:'), findsOneWidget);
    expect(find.textContaining('Kader Sayısı:'), findsOneWidget);
    expect(find.textContaining('Ruh Arzusu Sayısı:'), findsOneWidget);
    expect(find.textContaining('Kişilik Sayısı:'), findsOneWidget);
  });
}
