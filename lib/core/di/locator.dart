import 'package:flutter/material.dart';
import '../services/remote_config_service.dart';
import '../services/remote_config_service_impl.dart';
import '../../features/home/presentation/controllers/home_controller_impl.dart';
import '../../features/watch/presentation/controllers/watch_controller_impl.dart';

/// نظام بسيط وخفيف لحقن الاعتمادات (DI)
class Locator {
  static final Locator _instance = Locator._internal();
  factory Locator() => _instance;
  Locator._internal();

  late final GlobalKey<NavigatorState> navigatorKey;
  late final RemoteConfigService remoteConfigService;
  
  // المتحكمات
  late final HomeControllerImpl homeController;
  late final WatchControllerImpl watchController;

  void setup() {
    navigatorKey = GlobalKey<NavigatorState>();
    remoteConfigService = RemoteConfigServiceImpl();
    
    // تمرير الخدمة للمتحكمات لربطها بالـ JSON الديناميكي
    homeController = HomeControllerImpl(remoteConfigService, navigatorKey);
    watchController = WatchControllerImpl(remoteConfigService, navigatorKey);
  }
}

final locator = Locator();
