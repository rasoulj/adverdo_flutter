class VerificationRequest {
  final String code;
  final String remember;
  final Map deviceInfo;

  VerificationRequest({
    required this.code,
    required this.remember,
    required this.deviceInfo,
  });
}
