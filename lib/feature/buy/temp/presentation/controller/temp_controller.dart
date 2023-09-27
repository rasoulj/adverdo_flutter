import 'package:get/get.dart';
import '../../../../../config/video_player/video_player_mixin.dart';

class TempController extends GetxController with VideoPlayerMixin {
  @override
  void onInit() {
    initialazerVideoPlayer();
    super.onInit();
  }

  @override
  void dispose() {
    disposeVideoPlayer();
    super.dispose();
  }
}
