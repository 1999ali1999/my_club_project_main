import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_extensions.dart';
import '../controllers/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController controller;

  const SettingsScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 80),
                children: [
                  _buildProfileHeader(),
                  
                  _SettingsTile(
                    icon: Icons.notifications,
                    title: controller.tr('push_notifications'),
                    subtitle: controller.pushPermissionGranted 
                        ? controller.tr('enabled') 
                        : controller.tr('disabled'),
                    subtitleColor: controller.pushPermissionGranted 
                        ? AppColors.success 
                        : AppColors.danger,
                    onTap: controller.onPushSettingsTap,
                  ),
                  
                  _SettingsTile(
                    title: controller.tr('autoplay'),
                    trailing: Switch(
                      value: controller.autoplayEnabled,
                      onChanged: controller.toggleAutoplay,
                      activeThumbColor: AppColors.primary, // تم استبدال activeColor
                      activeTrackColor: AppColors.primary.withValues(alpha: 0.5), // تم استبدال withOpacity
                    ),
                  ),
                  
                  _SettingsTile(
                    icon: Icons.language,
                    title: controller.tr('language'),
                    trailing: _buildLanguageDropdown(),
                  ),
                  
                  const Divider(height: 1, color: Colors.white10).py(8),
                  
                  _SettingsTile(
                    icon: Icons.cleaning_services,
                    iconColor: controller.canClearCache ? Colors.white : Colors.grey,
                    title: controller.tr('clear_cache'),
                    titleColor: controller.canClearCache ? Colors.white : Colors.grey,
                    subtitle: 'Quota: ${controller.remainingCacheClears} left today',
                    trailing: !controller.canClearCache 
                        ? const Icon(Icons.lock_clock, color: AppColors.danger, size: 20)
                        : null,
                    onTap: controller.onClearCacheTap,
                  ),
                  
                  _SettingsTile(
                    icon: Icons.info_outline,
                    title: controller.tr('about_app'),
                    onTap: controller.onAboutAppTap,
                  ),
                ],
              ),
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
              controller.tr('settings'), 
              textAlign: TextAlign.center, 
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      color: const Color(0xFF202020),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        children: [
          Container(
            width: 60, height: 60,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: Colors.black, size: 32),
          ),
          16.gapH,
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('App User', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              Text('Headless Client', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        dropdownColor: const Color(0xFF202020),
        value: controller.languageCode,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        style: const TextStyle(color: Colors.white, fontSize: 14),
        onChanged: (v) => controller.changeLanguage(v!),
        items: [
          DropdownMenuItem(value: 'auto', child: Text(controller.tr('auto'))),
          DropdownMenuItem(value: 'en', child: Text(controller.tr('en'))),
          DropdownMenuItem(value: 'ar', child: Text(controller.tr('ar'))),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String title;
  final Color? titleColor;
  final String? subtitle;
  final Color? subtitleColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    this.icon,
    this.iconColor = Colors.white,
    required this.title,
    this.titleColor = Colors.white,
    this.subtitle,
    this.subtitleColor = AppColors.textMuted,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white10)),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor, size: 24),
              16.gapH,
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: titleColor, fontSize: 16)),
                  if (subtitle != null) ...[
                    4.gapV,
                    Text(subtitle!, style: TextStyle(color: subtitleColor, fontSize: 10)),
                  ],
                ],
              ),
            ),
            ?trailing, // تم استبدال (if (trailing != null) trailing!) بميزة Dart الحديثة
          ],
        ),
      ),
    );
  }
}
