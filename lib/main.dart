import 'package:flutter/material.dart';
import 'core/di/locator.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1. تهيئة الروابط والخدمات
  locator.setup();
  
  // 2. انتظار جلب ملف الـ JSON بالكامل من GitHub
  await locator.remoteConfigService.fetchAndParseConfig();
  
  // 3. حقن البيانات في المتحكمات (الآن فقط أصبحت البيانات جاهزة للواجهة)
  locator.initControllers();

  // 4. تشغيل التطبيق ورسم الإطار الأول
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
        fontFamily: 'Cairo',
      ),
      navigatorKey: locator.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.homeRoute,
    );
  }
}
