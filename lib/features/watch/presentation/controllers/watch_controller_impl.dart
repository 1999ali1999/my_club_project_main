import 'dart:async';
import 'package:flutter/material.dart';
import 'watch_controller.dart';
import '../../domain/models/watch_models.dart';
import '../../../../core/services/remote_config_service.dart';

class WatchControllerImpl extends ChangeNotifier implements WatchController {
  final RemoteConfigService _api;
  final GlobalKey<NavigatorState> _navigator;

  WatchControllerImpl(this._api, this._navigator);

  WatchDetails? _details;
  Season? _activeSeason;
  Episode? _activeEpisode;
  
  bool _isPlaying = false;
  bool _isFullscreen = false;
  bool _isMuted = false;
  
  // تجاهل تحذير final لأننا سنقوم بتعديلها عند ربط media_kit (إصلاح 7، 8، 9)
  // ignore: prefer_final_fields
  bool _showControls = true;
  // ignore: prefer_final_fields
  bool _isBuffering = false;
  
  bool _isRecordBlocked = false;
  int _drmCooldownTimer = 0;
  Timer? _drmLoopTimer;
  int _drmPlayTimer = 0;
  
  // تصحيح التسمية إلى lowerCamelCase (إصلاح 10)
  static const int drmLimitSec = 293;
  
  String? _currentSubtitleText;
  double _currentTime = 0;
  
  // ignore: prefer_final_fields
  double _duration = 0;
  
  bool _autoplayEnabled = true;

  @override WatchDetails? get details => _details;
  @override Season? get activeSeason => _activeSeason;
  @override Episode? get activeEpisode => _activeEpisode;
  @override bool get isPlaying => _isPlaying;
  @override bool get isFullscreen => _isFullscreen;
  @override bool get isMuted => _isMuted;
  @override bool get showControls => _showControls;
  @override bool get isBuffering => _isBuffering;
  @override bool get isRecordBlocked => _isRecordBlocked;
  @override int get drmCooldownTimer => _drmCooldownTimer;
  @override String? get currentSubtitleText => _currentSubtitleText;
  @override double get currentTime => _currentTime;
  @override double get duration => _duration;
  @override bool get autoplayEnabled => _autoplayEnabled;

  void initMovie(String id) {
    final rawDetails = _api.getContentDetails(id);
    if (rawDetails == null) return;
    
    _details = (
      id: rawDetails['id'] ?? id,
      title: rawDetails['title'] ?? '',
      rating: rawDetails['rating'] ?? '',
      releaseYear: rawDetails['releaseYear'] ?? '',
      ageRating: rawDetails['ageRating'] ?? '',
      overview: rawDetails['overview'] ?? '',
      watermark: null, 
      seasons: [], 
      recommendations: [],
    );
    
    _startDrmEngine();
    notifyListeners();
  }

  void _startDrmEngine() {
    _drmLoopTimer?.cancel();
    _drmLoopTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isRecordBlocked) {
        _drmCooldownTimer++;
        if (_drmCooldownTimer >= drmLimitSec) { // استخدام الاسم الجديد
          _isRecordBlocked = false;
          _drmCooldownTimer = 0;
          _drmPlayTimer = 0;
          if (_autoplayEnabled) togglePlay();
        }
        notifyListeners();
      } else if (_isPlaying) {
        _drmPlayTimer++;
        if (_drmPlayTimer >= drmLimitSec) { // استخدام الاسم الجديد
          _isRecordBlocked = true;
          _drmPlayTimer = 0;
          _isPlaying = false;
          notifyListeners();
        }
      }
    });
  }

  @override
  void togglePlay() {
    if (_isRecordBlocked) return;
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  @override void toggleMute() { _isMuted = !_isMuted; notifyListeners(); }
  @override void toggleFullscreen() { _isFullscreen = !_isFullscreen; notifyListeners(); }
  @override void toggleAutoplay() { _autoplayEnabled = !_autoplayEnabled; notifyListeners(); }
  @override void seekTo(double value) { _currentTime = value; notifyListeners(); }
  @override void changeSeason(String seasonId) {}
  @override void changeEpisode(Episode episode) {}
  @override void onActionTap(String actionId) {}
  @override void onMenuTap() {}
  @override void goBack() { _navigator.currentState?.pop(); }

  @override
  void dispose() {
    _drmLoopTimer?.cancel();
    super.dispose();
  }
}
