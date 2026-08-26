import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_extensions.dart';
import '../controllers/watch_controller.dart';
import '../widgets/player_widget.dart';
import '../widgets/info_widget.dart';
import '../widgets/playlist_widget.dart';

class WatchScreen extends StatelessWidget {
  final WatchController controller;

  const WatchScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.details == null) {
      return const Scaffold(
        backgroundColor: AppColors.bg,
        body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // التجاوب الذكي: إذا كان العرض أكبر من 900، نعرض التصميم الأفقي
            final isDesktop = constraints.maxWidth >= 900;

            if (isDesktop) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        PlayerWidget(controller: controller),
                        InfoWidget(controller: controller),
                      ],
                    ).px(32).py(32),
                  ),
                  Expanded(
                    flex: 3,
                    child: PlaylistWidget(controller: controller).py(32).pOnly(r: 32),
                  ),
                ],
              );
            }

            // التصميم العمودي (للهواتف)
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                if (!controller.isFullscreen) _buildMobileAppBar(),
                PlayerWidget(controller: controller),
                InfoWidget(controller: controller),
                PlaylistWidget(controller: controller).px(16).py(16),
                const SizedBox(height: 80),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMobileAppBar() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: controller.goBack,
        ),
        const Expanded(
          child: Text('مشاهدة', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        const SizedBox(width: 48), // لموازنة الزر
      ],
    ).p(12);
  }
}
