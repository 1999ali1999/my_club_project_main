import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_extensions.dart';
import '../controllers/watch_controller.dart';

class PlayerWidget extends StatelessWidget {
  final WatchController controller;

  const PlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isFs = controller.isFullscreen;
    
    return AspectRatio(
      aspectRatio: isFs ? MediaQuery.sizeOf(context).aspectRatio : 16 / 9,
      child: Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1. عنصر الفيديو الفعلي (سيتم ربطه بـ media_kit لاحقاً)
            const Center(child: Text('Video Surface Placeholder', style: TextStyle(color: Colors.white24))),

            // 2. العلامة المائية (Watermark)
            if (controller.details?.watermark != null)
              Positioned(
                top: 20, right: 20, // القيم تأتي من الـ Model لاحقاً
                child: Opacity(
                  opacity: controller.details!.watermark!.opacity,
                  child: Image.network(controller.details!.watermark!.url, width: 80),
                ),
              ),

            // 3. نصوص الترجمة (Subtitles)
            if (controller.currentSubtitleText != null)
              Positioned(
                bottom: isFs ? 10 : 20,
                left: 20, right: 20,
                child: Text(
                  controller.currentSubtitleText!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(offset: Offset(1, 1), blurRadius: 4, color: Colors.black),
                      Shadow(offset: Offset(-1, -1), blurRadius: 4, color: Colors.black),
                    ],
                  ),
                ),
              ),

            // 4. دائرة التحميل (Buffering)
            if (controller.isBuffering && !controller.isRecordBlocked)
              const Center(child: CircularProgressIndicator(color: AppColors.primary)),

            // 5. حماية تسجيل الشاشة (DRM Blocked)
            if (controller.isRecordBlocked)
              Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.security, color: AppColors.primary, size: 50),
                    12.gapV,
                    const Text('حماية التسجيل', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text('التطبيق لا يدعم تسجيل الشاشة المستمر. يرجى الانتظار...', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 12)).px(40).py(8),
                    Text('${controller.drmCooldownTimer}', style: const TextStyle(color: AppColors.danger, fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

            // 6. واجهة التحكم (Controls)
            if (controller.showControls && !controller.isRecordBlocked)
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // شريط التمرير (Slider)
                    Row(
                      children: [
                        Text(_format(controller.currentTime), style: const TextStyle(color: Colors.white, fontSize: 12)),
                        8.gapH,
                        Expanded(
                          child: SliderTheme(
                            data: SliderThemeData(
                              activeTrackColor: AppColors.primary,
                              inactiveTrackColor: Colors.white24,
                              thumbColor: AppColors.primary,
                              trackHeight: 4,
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
                            ),
                            child: Slider(
                              value: controller.currentTime,
                              max: controller.duration > 0 ? controller.duration : 1,
                              onChanged: controller.seekTo,
                            ),
                          ),
                        ),
                        8.gapH,
                        Text(_format(controller.duration), style: const TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ).px(16),
                    
                    // أزرار التحكم
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(icon: Icon(controller.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white), onPressed: controller.togglePlay),
                            IconButton(icon: Icon(controller.isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white), onPressed: controller.toggleMute),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(icon: const Icon(Icons.settings, color: Colors.white), onPressed: controller.onMenuTap),
                            IconButton(icon: Icon(isFs ? Icons.fullscreen_exit : Icons.fullscreen, color: Colors.white), onPressed: controller.toggleFullscreen),
                          ],
                        ),
                      ],
                    ).px(8),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _format(double sec) {
    final m = (sec / 60).floor();
    final s = (sec % 60).floor().toString().padLeft(2, '0');
    return '$m:$s';
  }
}
