import 'dart:async';
import '../../domain/models/home_models.dart';

/// واجهة مجردة (Abstract) تضمن غباء الـ UI (Dumb UI) وتمنع التجمد
abstract class HomeController {
  String? get watermarkUrl;
  int get unreadCount;
  HeroData? get heroData;
  List<HomeSection> get sections;
  
  Future<void> onRefresh();
  void onNotificationsTap();
  void onHeroVisitTap(String targetId);
  void onViewAllTap(String titleKey, List<MovieItem> items);
  void onMovieTap(String id);
}
