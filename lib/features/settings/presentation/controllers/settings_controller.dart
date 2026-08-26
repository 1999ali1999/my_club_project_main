abstract class SettingsController {
  // حالة الإشعارات
  bool get pushPermissionGranted;
  
  // حالة التشغيل التلقائي
  bool get autoplayEnabled;
  
  // اللغة
  String get languageCode;
  
  // نظام مسح الذاكرة المؤقتة (Cache Quota)
  bool get canClearCache;
  int get remainingCacheClears;
  
  // الأحداث التفاعلية
  void goBack();
  void onPushSettingsTap();
  void toggleAutoplay(bool value);
  void changeLanguage(String code);
  void onClearCacheTap();
  void onAboutAppTap();
  
  // المترجم (لجلب النصوص بناءً على اللغة)
  String tr(String key);
}
