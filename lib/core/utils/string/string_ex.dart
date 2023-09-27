extension StringEx on String {
  String camelToSentence() {
    return replaceAllMapped(RegExp(r'^([a-z])|[A-Z]'),
            (Match m) => m[1] == null ? " ${m[0]}" : (m[1]?.toUpperCase() ?? ""));
  }

  String trimMiddle([int maxLength = 24]) {
    if(length <= maxLength) return this;
    int half = (maxLength/2).round();
    String start = substring(0, half - 3);
    String end = substring(length - half + 3);
    return "$start ... $end";
  }


}

