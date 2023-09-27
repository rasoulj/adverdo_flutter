import 'package:get/get.dart';
import '../../data/model/request/campaign_bid_request.dart';
import '../../domain/usecase/campaign_bid_usecase.dart';

class CampaignBidController extends GetxController {
  CampaignBidController({required this.campaignBidUseCase});
  final CampaignBidUseCase campaignBidUseCase;

  void updateBide() async {
    var request = const CampaignBidRequest(id: "10");
    var result = await campaignBidUseCase(request: request);
    result.fold(
      (failure) => null,
      (data) => null,
    );
  }
}
