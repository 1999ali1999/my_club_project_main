import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart'; // استدعاء ملف main الصحيح

void main() {
  testWidgets('Video Engine App Smoke Test', (WidgetTester tester) async {
    // بناء التطبيق وإطلاق إطار العمل (إصلاح 14 - استخدام VideoEngineApp)
    await tester.pumpWidget(const VideoEngineApp());

    // التحقق من أن جذور التطبيق تعمل بنجاح
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
