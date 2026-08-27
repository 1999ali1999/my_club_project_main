import '../../domain/models/view_all_models.dart';

abstract class ViewAllController {
  String get titleKey;
  List<ViewAllItem> get items;
  
  void onMovieTap(String id);
  void goBack();
  String tr(String key);
}
