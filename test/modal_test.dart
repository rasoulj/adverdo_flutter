import 'package:advedro/core/utils/string/string_ex.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test CamelToSentence", () {
    String text = "camelCaseTestIt";

    String res = text.camelToSentence();
    expect(res, "Camel Case Test It");
  });
}