/// نماذج بيانات خفيفة جداً لمشغل الفيديو وتفاصيل العرض
typedef Watermark = ({String url, double opacity, String width, String top, String left});
typedef Episode = ({String id, String title, String duration, String? thumbnailUrl});
typedef Season = ({String id, String titleKey, List<Episode> episodes});
typedef WatchDetails = ({
  String id, 
  String title, 
  String rating, 
  String releaseYear, 
  String ageRating, 
  String overview,
  Watermark? watermark,
  List<Season> seasons,
  List<({String id, String imageUrl})> recommendations
});
