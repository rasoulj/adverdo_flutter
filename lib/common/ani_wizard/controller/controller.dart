
import 'package:get/get.dart';

class AniWizardController extends GetxController {
  final int count;
  final Rx<int> _stage = 0.obs;

  AniWizardController({this.count = 1});

  int get stage => _stage.value;
  set stage(int value) {
    if(value < 0 || value >= count) return;
    _stage.value = value;
  }
}
