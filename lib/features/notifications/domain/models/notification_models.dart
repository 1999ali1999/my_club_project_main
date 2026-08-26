/// نموذج بيانات الإشعار الخفيف باستخدام Dart 3 Records
typedef NotificationItem = ({
  String id, 
  String title, 
  String body, 
  String? image, 
  String timeFormatted, 
  bool read,
  String? targetId
});
