import 'package:intl/intl.dart';

/// Defines a model for Json data
typedef Json = Map<String, dynamic>;

/// Extension methods applicable on [Json]
extension JsonEx on Json {

  /// Gets an [String] field of a [Json] using its key
  String getString(String key, {String defaultValue = ""}) {
    return containsKey(key) ? (this[key] as String?) ?? defaultValue : defaultValue;
  }

  /// Gets an [bool] field of a [Json] using its key
  bool getBool(String key, {bool defaultValue = false}) {
    return containsKey(key) ? this[key] as bool : defaultValue;
  }

  /// Gets an [DateTime] field of a [Json] using its key
  DateTime? getDateTime(String key, {DateTime? defaultValue}) {
    String str = getString(key);
    if(str == "") {
      return defaultValue;
    }
    //Date format: 2022/08/31 10:22:49
    var parts = str.split(" ");
    if(parts.length != 2) {
      return defaultValue;
    }

    var dateParts = parts.first.split("/");
    var timeParts = parts.last.split(":");

    if(dateParts.length != 3 && timeParts.length != 3) {
      return defaultValue;
    }

    return DateTime(
        int.parse(dateParts[0]),
        int.parse(dateParts[1]),
        int.parse(dateParts[2]),
        int.parse(timeParts[0]),
        int.parse(timeParts[1]),
        int.parse(timeParts[2]),
    );
  }

  /// Gets an [int] field of a [Json] using its key
  int getInt(String key, {int defValue = 0}) {
    try {
      return containsKey(key) ? this[key] : defValue;
    } catch(e) {
      return defValue;
    }
  }

}

/// Extension methods applicable on [DateTime]
extension DateTimeEx on DateTime {

  /// Converts a [DateTime] to Adverdo's format
  String toStringAdv() => DateFormat("yyyy/MM/dd hh:mm:ss").format(this);
}