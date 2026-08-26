import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_extensions.dart';
import '../controllers/watch_controller.dart';

class InfoWidget extends StatelessWidget {
  final WatchController controller;

  const InfoWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final data = controller.details!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.gapV,
        Text(data.title, style: const TextStyle(color: Colors.white, fontSize: 24, height: 1.4, fontWeight: FontWeight.bold)),
        12.gapV,
        Row(
          children: [
            const Icon(Icons.star, color: AppColors.primary, size: 16),
            4.gapH,
            Text(data.rating, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14)),
            16.gapH,
            Text(data.releaseYear, style: const TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w600, fontSize: 14)),
            16.gapH,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(6)),
              child: Text(data.ageRating, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        16.gapV,
        Row(
          children: [
            _ActionBtn(icon: Icons.add, label: 'قائمتي', onTap: () => controller.onActionTap('list')),
            16.gapH,
            _ActionBtn(icon: Icons.share, label: 'مشاركة', onTap: () => controller.onActionTap('share')),
            16.gapH,
            _ActionBtn(icon: Icons.flag, label: 'إبلاغ', onTap: () => controller.onActionTap('report')),
          ],
        ),
        16.gapV,
        Text(
          data.overview,
          maxLines: 2, // سيتم ربطها بحالة Expansion لاحقاً عبر الـ Controller
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColors.textMuted, height: 1.6),
        ),
      ],
    ).px(16);
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionBtn({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: AppColors.textMuted),
          4.gapV,
          Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 10)),
        ],
      ),
    );
  }
}
