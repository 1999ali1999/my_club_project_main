import 'dart:convert';

import 'package:flutter/foundation.dart'; // للوصول إلى debugPrint
import 'package:http/http.dart' as http;

import 'remote_config_service.dart';

class RemoteConfigServiceImpl implements RemoteConfigService {
  // تم تصحيح التسمية لتصبح lowerCamelCase (إصلاح 5)
  static const String remoteJsonUrl =
      "https://raw.githubusercontent.com/ben10show1999/club_1/refs/heads/main/config_1.json";

  Map<String, dynamic>? _cachedData;

  @override
  Future<void> fetchAndParseConfig() async {
    try {
      final uri = Uri.parse(
        '$remoteJsonUrl?t=${DateTime.now().millisecondsSinceEpoch}',
      );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        _cachedData = json.decode(utf8.decode(response.bodyBytes));
      } else {
        throw Exception('Failed to load JSON: ${response.statusCode}');
      }
    } catch (e) {
      // تم استبدال print بـ debugPrint لبيئة الإنتاج (إصلاح 6)
      debugPrint('Error fetching config: $e');
    }
  }

  @override
  Map<String, dynamic>? getPageConfig(String pageId) {
    if (_cachedData == null) return null;
    final dynamicPages = _cachedData!['dynamicPages'] as Map<String, dynamic>?;
    return dynamicPages?[pageId];
  }

  @override
  Map<String, dynamic>? getContentDetails(String contentId) {
    if (_cachedData == null) return null;
    final content = _cachedData!['content'] as Map<String, dynamic>?;
    return content?[contentId];
  }

  @override
  List<dynamic> getDynamicSections() {
    if (_cachedData == null) return [];
    final home = _cachedData!['home'] as Map<String, dynamic>?;
    return home?['sections'] ?? [];
  }

  @override
  Map<String, dynamic>? getHeroData() {
    return _cachedData?['home']?['heroData'];
  }

  @override
  List<dynamic> getSearchSuggestions() {
    return _cachedData?['searchSuggestions'] ?? [];
  }

  @override
  Map<String, dynamic>? getAppConfig() {
    return _cachedData?['appConfig'];
  }
}
