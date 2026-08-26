import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_extensions.dart';
import '../controllers/watch_controller.dart';

class PlaylistWidget extends StatelessWidget {
  final WatchController controller;

  const PlaylistWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final seasons = controller.details?.seasons ?? [];
    if (seasons.isEmpty) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: Colors.white10),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: AppColors.bg,
                  value: controller.activeSeason?.id ?? seasons.first.id,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  onChanged: (v) => controller.changeSeason(v!),
                  items: seasons.map((s) => DropdownMenuItem(value: s.id, child: Text(s.titleKey))).toList(),
                ),
              ),
              Row(
                children: [
                  const Text('تشغيل تلقائي', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                  8.gapH,
                  Switch(
                    value: controller.autoplayEnabled,
                    onChanged: (_) => controller.toggleAutoplay(),
                    activeThumbColor: AppColors.primary, // تم استبدال activeColor هنا
                  ),
                ],
              ),
            ],
          ).p(12),
          const Divider(height: 1, color: Colors.white10),
          
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 400),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: controller.activeSeason?.episodes.length ?? 0,
              itemBuilder: (ctx, i) {
                final ep = controller.activeSeason!.episodes[i];
                final isSelected = ep.id == controller.activeEpisode?.id;
                
                return InkWell(
                  onTap: () => controller.changeEpisode(ep),
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white10 : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 110, height: 65,
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(6)),
                          clipBehavior: Clip.antiAlias,
                          child: ep.thumbnailUrl != null 
                              ? Image.network(ep.thumbnailUrl!, fit: BoxFit.cover)
                              : const Center(child: Icon(Icons.play_circle_outline, color: Colors.white24)),
                        ),
                        12.gapH,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(ep.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: isSelected ? AppColors.primary : Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                              4.gapV,
                              Text(ep.duration, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ).pOnly(b: 8);
              },
            ),
          ),
        ],
      ),
    );
  }
}
