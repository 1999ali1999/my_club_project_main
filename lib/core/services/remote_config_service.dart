import 'dart:async';

abstract class RemoteConfigService {
  Future<void> fetchAndParseConfig();
  Map<String, dynamic>? getPageConfig(String pageId);
  Map<String, dynamic>? getContentDetails(String contentId);
  List<dynamic> getDynamicSections();
  
  // الدوال التي تمت إضافتها لتطابق التنفيذ الفعلي (إصلاح 11 و 12)
  Map<String, dynamic>? getHeroData();
  List<dynamic> getSearchSuggestions();
  Map<String, dynamic>? getAppConfig();
}
