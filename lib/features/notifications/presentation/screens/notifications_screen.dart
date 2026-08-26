import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_extensions.dart';
import '../../domain/models/notification_models.dart';
import '../controllers/notifications_controller.dart';

class NotificationsScreen extends StatelessWidget {
  final NotificationsController controller;

  const NotificationsScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: controller.visibleNotifications.isEmpty 
                  ? _buildEmptyState()
                  : _buildNotificationsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bg,
        border: Border(bottom: BorderSide(color: AppColors.surface)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
            onPressed: controller.goBack,
          ),
          Expanded(
            child: Text(
              controller.tr('notifications'),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(width: 48), // مساحة فارغة لموازنة زر الرجوع
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.notifications_off, color: Colors.white24, size: 60),
        16.gapV,
        Text(
          controller.tr('empty_notifications'), 
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    ).pOnly(t: 100);
  }

  Widget _buildNotificationsList() {
    return Column(
      children: [
        // شريط الإجراءات العلوي
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${controller.tr('unread')}: ${controller.unreadCount}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textMuted),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: controller.markAllAsRead,
                  child: Text(controller.tr('mark_all_read'), style: const TextStyle(color: AppColors.primary)),
                ),
                TextButton(
                  onPressed: controller.clearAll,
                  child: Text(controller.tr('clear_all'), style: const TextStyle(color: AppColors.danger)),
                ),
              ],
            ),
          ],
        ).px(16).py(8),

        // قائمة الإشعارات (التحميل الكسول)
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 80),
            itemCount: controller.visibleNotifications.length,
            itemBuilder: (context, index) {
              return _NotificationTile(
                notif: controller.visibleNotifications[index],
                controller: controller,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final NotificationItem notif;
  final NotificationsController controller;

  const _NotificationTile({required this.notif, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.onNotificationTap(notif),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // تطبيق لون الخلفية للإشعار غير المقروء تماماً كما في CSS
          color: !notif.read ? AppColors.primary.withValues(alpha: 0.08) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة المصغرة أو التصميم البديل
            Container(
              width: 110, height: 65,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.white10),
              ),
              clipBehavior: Clip.antiAlias,
              child: notif.image != null
                  ? Image.network(
                      notif.image!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => _buildFallbackIcon(),
                    )
                  : _buildFallbackIcon(),
            ),
            12.gapH,
            
            // المعلومات والنصوص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notif.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: !notif.read ? AppColors.primary : Colors.white, 
                      fontWeight: FontWeight.bold, 
                      fontSize: 14,
                    ),
                  ),
                  4.gapV,
                  Text(
                    notif.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                  ),
                  6.gapV,
                  Text(
                    notif.timeFormatted,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ),
            
            // النقطة الخاصة بالإشعار غير المقروء
            if (!notif.read)
              Container(
                width: 8, height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ).pOnly(t: 28), // التوسيط العمودي التقريبي

            // قائمة الخيارات (Dropdown / PopupMenu) لحذف الإشعار
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.grey, size: 20),
              color: const Color(0xFF2A2A2A), // لون خلفية القائمة مطابق للـ CSS
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              onSelected: (value) {
                if (value == 'delete') {
                  controller.deleteNotification(notif.id);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Row(
                    children: [
                      const Icon(Icons.delete_outline, color: AppColors.danger, size: 18),
                      12.gapH,
                      Text(controller.tr('delete'), style: const TextStyle(color: AppColors.danger)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFallbackIcon() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A2A2A), Color(0xFF151515)],
        ),
      ),
      child: const Center(
        child: Icon(Icons.notifications_active, color: AppColors.primary),
      ),
    );
  }
}
