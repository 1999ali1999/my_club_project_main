import 'package:flutter/material.dart';
import 'view_all_controller.dart';
import '../../domain/models/view_all_models.dart';
import '../../../../core/router/app_router.dart';

class ViewAllControllerImpl extends ChangeNotifier implements ViewAllController {
  final GlobalKey<NavigatorState> _navigator;
  final ViewAllArgs _args;

  ViewAllControllerImpl(this._navigator, this._args);

  @override String get titleKey => _args.titleKey;
  @override List<ViewAllItem> get items => _args.items;

  @override
  void onMovieTap(String id) {
    _navigator.currentState?.pushNamed(AppRouter.watchRoute, arguments: id);
  }

  @override
  void goBack() {
    _navigator.currentState?.pop();
  }

  @override
  String tr(String key) {
    // سيتم ربطه لاحقاً بمحرك الترجمة الفعلي
    return key; 
  }
}
