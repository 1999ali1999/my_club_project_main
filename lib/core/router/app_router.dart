import 'package:flutter/material.dart' hide SearchController;

import 'deferred_loader.dart';
import '../di/locator.dart';

import '../../features/search/presentation/controllers/search_controller.dart';
import '../../features/settings/presentation/controllers/settings_controller.dart';
import '../../features/my_list/presentation/controllers/my_list_controller.dart';
import '../../features/notifications/presentation/controllers/notifications_controller.dart';
import '../../features/dynamic_page/presentation/screens/dynamic_page_screen.dart' as dynamic_logic;
import '../../features/view_all/presentation/controllers/view_all_controller_impl.dart';
import '../../features/view_all/domain/models/view_all_models.dart';

import '../../features/home/presentation/screens/home_screen.dart' deferred as home_view;
import '../../features/watch/presentation/screens/watch_screen.dart' deferred as watch_view;
import '../../features/search/presentation/screens/search_screen.dart' deferred as search_view;
import '../../features/settings/presentation/screens/settings_screen.dart' deferred as settings_view;
import '../../features/my_list/presentation/screens/my_list_screen.dart' deferred as my_list_view;
import '../../features/notifications/presentation/screens/notifications_screen.dart' deferred as notifications_view;
import '../../features/dynamic_page/presentation/screens/dynamic_page_screen.dart' deferred as dynamic_view;
import '../../features/view_all/presentation/screens/view_all_screen.dart' deferred as view_all_view;

class AppRouter {
  static const String homeRoute = '/';
  static const String watchRoute = '/watch';
  static const String searchRoute = '/search';
  static const String settingsRoute = '/settings';
  static const String myListRoute = '/list';
  static const String notificationsRoute = '/notifications';
  static const String dynamicPageRoute = '/page';
  static const String viewAllRoute = '/view_all';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final uri = Uri.tryParse(settings.name ?? '');
    final path = uri?.path ?? '/';
    
    switch (path) {
      case homeRoute:
        return _buildDeferredRoute(
          loader: home_view.loadLibrary,
          builder: (context) {
            final controller = locator.homeController;
            return ListenableBuilder(
              listenable: controller,
              builder: (context, child) => home_view.HomeScreen(controller: controller),
            );
          },
        );

      case watchRoute:
        final id = settings.arguments as String? ?? uri?.queryParameters['id'] ?? '';
        return _buildDeferredRoute(
          loader: watch_view.loadLibrary,
          builder: (context) {
            final controller = locator.watchController;
            controller.initMovie(id);
            return ListenableBuilder(
              listenable: controller,
              builder: (context, child) => watch_view.WatchScreen(controller: controller),
            );
          },
        );

      case viewAllRoute:
        final args = settings.arguments as ViewAllArgs;
        return _buildDeferredRoute(
          loader: view_all_view.loadLibrary,
          builder: (context) {
            final controller = ViewAllControllerImpl(locator.navigatorKey, args);
            return ListenableBuilder(
              listenable: controller,
              builder: (context, child) => view_all_view.ViewAllScreen(controller: controller),
            );
          },
        );

      case dynamicPageRoute:
        return _buildDeferredRoute(
          loader: dynamic_view.loadLibrary,
          builder: (context) => dynamic_view.DynamicPageScreen(
            controller: settings.arguments as dynamic_logic.DynamicPageController,
          ),
        );

      case searchRoute:
        return _buildDeferredRoute(
          loader: search_view.loadLibrary,
          builder: (context) => search_view.SearchScreen(
            controller: settings.arguments as SearchController,
          ),
        );

      case settingsRoute:
        return _buildDeferredRoute(
          loader: settings_view.loadLibrary,
          builder: (context) => settings_view.SettingsScreen(
            controller: settings.arguments as SettingsController,
          ),
        );

      case myListRoute:
        return _buildDeferredRoute(
          loader: my_list_view.loadLibrary,
          builder: (context) => my_list_view.MyListScreen(
            controller: settings.arguments as MyListController,
          ),
        );

      case notificationsRoute:
        return _buildDeferredRoute(
          loader: notifications_view.loadLibrary,
          builder: (context) => notifications_view.NotificationsScreen(
            controller: settings.arguments as NotificationsController,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: Text('مسار غير موجود', style: TextStyle(color: Colors.white))),
          ),
        );
    }
  }

  static PageRouteBuilder _buildDeferredRoute({
    required LibraryLoader loader,
    required Widget Function(BuildContext) builder,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DeferredLoader(
        libraryLoader: loader,
        builder: () => builder(context),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
