import '../../domain/models/my_list_models.dart';

abstract class MyListController {
  List<MyListItem> get items;
  
  // الأحداث
  void onMovieTap(String id);
  void goBack();
  
  // المترجم (لجلب النصوص بناءً على اللغة)
  String tr(String key);
}
