import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

mixin VideoPlayerMixin {
  late Rx<VideoPlayerController> videoPlayerController;

  void initialazerVideoPlayer() async {
    var url = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    videoPlayerController = VideoPlayerController.network(url).obs;
    videoPlayerController.value.addListener(() {});
    videoPlayerController.value.setLooping(true);
    videoPlayerController.value.initialize();
  }

  void disposeVideoPlayer() {
    videoPlayerController.value.dispose();
  }
}
