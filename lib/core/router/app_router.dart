import 'package:flutter/material.dart' hide SearchController;

import 'deferred_loader.dart';
import '../di/locator.dart';

import '../../features/home/presentation/screens/home_screen.dart' deferred as home_view;
import '../../features/watch/presentation/screens/watch_screen.dart' deferred as watch_view;

class AppRouter {
  static const String homeRoute = '/';
  static const String watchRoute = '/watch';
  static const String searchRoute = '/search';
  static const String settingsRoute = '/settings';
  static const String myListRoute = '/list';
  static const String notificationsRoute = '/notifications';

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
              builder: (context, child) => home_view.HomeScreen(controller: controller), // تم الإصلاح
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
              builder: (context, child) => watch_view.WatchScreen(controller: controller), // تم الإصلاح
            );
          },
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
