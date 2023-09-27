import 'failures.dart';

class FailModel {
  final Failure failure;

  FailModel({required this.failure});

  String fail() {
    Map failures = failure.props.first as Map;
    return failures['non_field_errors'][0].toString();
  }
}
