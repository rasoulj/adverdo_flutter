import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// Defines keys used in [AppSettingsController]
class _K {
  static const String boxName = "AppSettingsBox";

  static const String darkMode = "darkMode";
  static const String language = "language";
  static const String defLanguage = "en-US";

}

/// Used for save and read Applications settings in local storage
///
/// A simple wrapper for [Hive] package
class AppSettingsController extends GetxController {

  @override
  void onInit() {
    init().then((value) {});
    super.onInit();
  }

  /// Initializing the class
  Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    await Hive.openBox(_K.boxName);
    _box = Hive.box(_K.boxName);

    _darkMode.value = _box.get(_K.darkMode, defaultValue: false);
    _language.value = _box.get(_K.language, defaultValue: _K.defLanguage);
  }

  /// [Box] instance
  late Box _box;

  /// Defining Observables
  final _darkMode = false.obs;
  final _language  = _K.defLanguage.obs;

  /// Whether app is in [darkMode]
  bool get darkMode => _darkMode.value;
  set darkMode(bool value) {
    _box.put(_K.darkMode, value);
    _darkMode.value = value;
  }

  /// Current [language] used in the application
  String get language => _language.value;
  set language(String value) {
    _box.put(_K.language, value);
    _language.value = value;
  }
}
