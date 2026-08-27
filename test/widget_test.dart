import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// الاستيراد المطلق باستخدام اسم الحزمة كما يتطلبه الـ Linter
import 'package:my_club_project_main/main.dart'; 

void main() {
  testWidgets('Video Engine App Smoke Test', (WidgetTester tester) async {
    await tester.pumpWidget(const VideoEngineApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
