import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_extensions.dart';
import '../../../../core/widgets/main_bottom_nav.dart';
import '../../../../core/router/app_router.dart';
import '../../domain/models/home_models.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller;

  const HomeScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const MainBottomNav(currentRoute: AppRouter.homeRoute),
      body: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.surface,
        onRefresh: controller.onRefresh,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildAppBar(),
            if (controller.heroData != null)
              SliverToBoxAdapter(
                child: _HeroSection(
                  data: controller.heroData!, 
                  onVisit: () => controller.onHeroVisitTap(controller.heroData!.targetId)
                ),
              ),
            SliverList.builder(
              itemCount: controller.sections.length,
              itemBuilder: (ctx, i) => _SectionWidget(
                section: controller.sections[i],
                onViewAll: () => controller.onViewAllTap(
                  controller.sections[i].titleKey, 
                  controller.sections[i].items
                ),
                onMovieTap: controller.onMovieTap,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      pinned: false,
      floating: true,
      automaticallyImplyLeading: false, 
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.appBarGradient,
          ),
        ),
      ),
      title: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            controller.watermarkUrl != null
                ? Image.network(
                    controller.watermarkUrl!, 
                    height: 36, 
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) => const SizedBox.shrink(), // تم الإصلاح هنا
                  )
                : const SizedBox.shrink(),
                
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white),
                  onPressed: controller.onNotificationsTap,
                ),
                if (controller.unreadCount > 0)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      width: 8, height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.danger,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black54)],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final HeroData data;
  final VoidCallback onVisit;

  const _HeroSection({required this.data, required this.onVisit});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height * 0.6; 
    
    return SizedBox(
      height: h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(data.posterUrl, fit: BoxFit.cover),
          Positioned(
            bottom: 0, left: 0, right: 0,
            height: h * 0.6,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: AppColors.heroGradient,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40, left: 20, right: 20,
            child: Column(
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 32, 
                    fontWeight: FontWeight.w700, 
                    color: Colors.white,
                    shadows: [Shadow(offset: Offset(2, 2), blurRadius: 4, color: Colors.black87)],
                  ),
                ),
                12.gapV,
                Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    ElevatedButton.icon(
                      onPressed: onVisit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.textMain,
                        foregroundColor: AppColors.bg,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      icon: const Icon(Icons.play_arrow_rounded, size: 16),
                      label: const Text('زيارة', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionWidget extends StatelessWidget {
  final HomeSection section;
  final VoidCallback onViewAll;
  final Function(String) onMovieTap;

  const _SectionWidget({required this.section, required this.onViewAll, required this.onMovieTap});

  @override
  Widget build(BuildContext context) {
    final cardW = (MediaQuery.sizeOf(context).width / 3.5).clamp(110.0, 150.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  section.titleKey,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                8.gapH,
                Container(width: 4, height: 20, color: AppColors.primary),
              ],
            ).px(16),
            TextButton(
              onPressed: onViewAll,
              child: const Text('عرض الكل', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
            ).px(8),
          ],
        ).pOnly(b: 12),
        
        SizedBox(
          height: cardW * 1.5, 
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: section.items.take(8).length, 
            separatorBuilder: (_, _) => 16.gapH, // تم الإصلاح هنا
            itemBuilder: (ctx, i) {
              final item = section.items[i];
              return GestureDetector(
                onTap: () => onMovieTap(item.id),
                child: Container(
                  width: cardW,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    item.imageUrl, 
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => const Center(child: Icon(Icons.error, color: Colors.grey)), // تم الإصلاح هنا
                  ),
                ),
              );
            },
          ),
        ),
        24.gapV,
      ],
    );
  }
}
