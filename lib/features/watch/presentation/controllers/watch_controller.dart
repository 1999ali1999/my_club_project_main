import '../../domain/models/watch_models.dart';

abstract class WatchController {
  WatchDetails? get details;
  Season? get activeSeason;
  Episode? get activeEpisode;
  
  // حالة المشغل
  bool get isPlaying;
  bool get isFullscreen;
  bool get isMuted;
  bool get showControls;
  bool get isBuffering;
  
  // نظام الحماية (DRM)
  bool get isRecordBlocked;
  int get drmCooldownTimer;
  
  // الترجمة والتشغيل
  String? get currentSubtitleText;
  double get currentTime;
  double get duration;
  bool get autoplayEnabled;
  
  // الأحداث
  void togglePlay();
  void toggleMute();
  void toggleFullscreen();
  void seekTo(double value);
  void changeSeason(String seasonId);
  void changeEpisode(Episode episode);
  void toggleAutoplay();
  void onActionTap(String actionId); // list, share, report
  void onMenuTap(); // settings menu
  void goBack();
}
