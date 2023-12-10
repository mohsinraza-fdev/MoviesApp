import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ten_twenty_test/app/core/core_view_models/core_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerViewModel extends CoreViewModel {
  String linkCode;
  WatchTrailerViewModel({
    required this.linkCode,
  });
  YoutubePlayerController? controller;

  Timer? hideSystemUiTimer;

  @override
  Future<void> initialise() async {
    controller = YoutubePlayerController(
      initialVideoId: linkCode,
      flags: const YoutubePlayerFlags(disableDragSeek: true),
    );
    controller?.toggleFullScreenMode();
    SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
      if (systemOverlaysAreVisible) {
        hideSystemUiTimer?.cancel();
        hideSystemUiTimer = Timer(
          const Duration(seconds: 3),
          () {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
          },
        );
      }
    });
    return super.initialise();
  }

  @override
  void dispose() {
    if (controller?.value.isFullScreen ?? false) {
      controller?.toggleFullScreenMode();
    }
    hideSystemUiTimer?.cancel();
    controller?.dispose();
    super.dispose();
  }
}
