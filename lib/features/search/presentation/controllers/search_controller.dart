import '../../domain/models/search_models.dart';

abstract class SearchController {
  String get searchQuery;
  List<SearchResultItem> get filteredResults;
  
  // الأحداث
  void onSearchChanged(String query);
  void onMovieTap(String id);
  void goBack();
}
