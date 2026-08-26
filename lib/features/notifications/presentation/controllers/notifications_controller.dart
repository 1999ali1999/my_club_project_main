import '../../domain/models/notification_models.dart';

abstract class NotificationsController {
  List<NotificationItem> get visibleNotifications;
  int get unreadCount;
  
  // الأحداث
  void onNotificationTap(NotificationItem notif);
  void markAllAsRead();
  void clearAll();
  void deleteNotification(String id);
  void goBack();
  
  // المترجم (لجلب النصوص بناءً على اللغة)
  String tr(String key);
}
