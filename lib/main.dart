import 'package:flutter/material.dart';
import 'core/di/locator.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_colors.dart';

void main() async {
  // تهيئة محرك Flutter (خاصة للـ Web)
  WidgetsFlutterBinding.ensureInitialized();
  
  // تهيئة حقن الاعتمادات
  locator.setup();
  
  // جلب البيانات الديناميكية من الـ Remote JSON قبل رسم أول إطار (Frame)
  await locator.remoteConfigService.fetchAndParseConfig();

  runApp(const VideoEngineApp());
}

class VideoEngineApp extends StatelessWidget {
  const VideoEngineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Engine V18.34',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          surface: AppColors.surface,
          error: AppColors.danger,
        ),
        useMaterial3: true,
        fontFamily: 'Cairo', // نفس الخط المستخدم في المشروع الأصلي
      ),
      navigatorKey: locator.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.homeRoute,
    );
  }
}
