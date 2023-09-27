import 'package:get/get.dart';
import '../../data/model/request/target_campaign_request.dart';
import '../../data/model/response/target_campaign_model.dart';
import '../../domain/usecase/target_campaign_usecase.dart';

class TargetCampaignController extends GetxController {
  TargetCampaignController({required this.targetCampaignUseCase});
  // usecase
  final TargetCampaignUseCase targetCampaignUseCase;
  // model
  Rx<TargetCampaignModel> targetCampaignModel = TargetCampaignModel().obs;

  void getTarget() async {
    var request = TargetCampaignRequest();
    var result = await targetCampaignUseCase(request: request);
    result.fold(
      (failure) => null,
      (data) => targetCampaignModel.value = data,
    );
  }
}
