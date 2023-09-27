class Urls {
  static const String baseUrl = "https://stage.advedro.com/v1/";
  // auth
  static const String loginUrl = "api/auth/login";
  static const String signUpUrl = "api/auth/signup";
  static const String verificationGetCodeUrl = "api/auth/verification";
  static const String resendVerificationGetCodeUrl = "api/auth/verification/resend";
  static const String forgetPasswordUrl = "api/auth/lost-password";

  /// Change Password API End-point
  static const String changePasswordUrl = "api/auth/login";

  /// Account Detail API End-point
  static const String accountDetailUrl = "api/auth/login";

  /// Account Detail API End-point
  static const String mediaLibrariesUrl = "api/buy/medialibraries";

  /// Campaign urls
  static const String campaignUrl = "v1/api/buy/campaigns";
  static const String createCampaignUrl = "v1/api/buy/campaigns/";
  static const String editCampaignUrl = "v1/api/buy/campaigns/";
  static const String deleteCampaignUrl = "v1/api/buy/campaigns/";
  static const String targetCampaignUrl = "v1/api/buy/campaigns/targets";
  static String campaignDailyBudgetUrl({required String id}) => "v1/api/buy/campaigns/$id/daily-budget";
  static String campaignBidUrl({required String id}) => "v1/api/buy/campaigns/$id//bid-booster";
}
