import 'package:flutter/material.dart';
import 'home_controller.dart';
import '../../domain/models/home_models.dart';
import '../../../../core/services/remote_config_service.dart';
import '../../../../core/router/app_router.dart';
// تمت إزالة الاستيراد غير المستخدم لنموذج view_all_models

class HomeControllerImpl extends ChangeNotifier implements HomeController {
  final RemoteConfigService _api;
  final GlobalKey<NavigatorState> _navigator;

  HomeControllerImpl(this._api, this._navigator) {
    _loadData();
  }

  String? _watermarkUrl;
  HeroData? _heroData;
  List<HomeSection> _sections = [];
  
  // ignore: prefer_final_fields
  int _unreadCount = 0;

  @override String? get watermarkUrl => _watermarkUrl;
  @override HeroData? get heroData => _heroData;
  @override List<HomeSection> get sections => _sections;
  @override int get unreadCount => _unreadCount;

  void _loadData() {
    final appConfig = _api.getAppConfig();
    if (appConfig != null && appConfig['watermark']?['enabled'] == true) {
      _watermarkUrl = appConfig['watermark']['url'];
    }

    final rawHero = _api.getHeroData();
    if (rawHero != null) {
      _heroData = (
        targetId: rawHero['targetId'] ?? '',
        title: rawHero['title'] ?? '',
        posterUrl: rawHero['posterUrl'] ?? ''
      );
    }

    final rawSections = _api.getDynamicSections();
    _sections = rawSections.map((s) {
      final items = (s['items'] as List<dynamic>?)?.map((i) => (
        id: i['id'] as String,
        imageUrl: i['imageUrl'] as String,
      )).toList() ?? [];
      
      return (titleKey: s['titleKey'] as String? ?? '', items: items);
    }).toList();

    notifyListeners();
  }

  @override
  Future<void> onRefresh() async {
    await _api.fetchAndParseConfig();
    _loadData();
  }

  @override
  void onNotificationsTap() {
    _navigator.currentState?.pushNamed(AppRouter.notificationsRoute);
  }

  @override
  void onHeroVisitTap(String targetId) {
    onMovieTap(targetId);
  }

  @override
  void onViewAllTap(String titleKey, List<MovieItem> items) {
    final args = (
      titleKey: titleKey,
      items: items.map((i) => (id: i.id, imageUrl: i.imageUrl)).toList(),
    );
    _navigator.currentState?.pushNamed(AppRouter.viewAllRoute, arguments: args);
  }

  @override
  void onMovieTap(String id) {
    _navigator.currentState?.pushNamed(AppRouter.watchRoute, arguments: id);
  }
}
