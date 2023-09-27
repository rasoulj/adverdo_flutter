import 'package:advedro/feature/buy/campaigns/campaign/data/model/request/delete_campaign_request.dart';
import 'package:advedro/feature/buy/campaigns/campaign/data/model/response/delet_campaign_model.dart';
import 'package:advedro/feature/buy/campaigns/campaign/domain/usecase/delete_campaign_usecase.dart';
import 'package:advedro/feature/buy/campaigns/campaign/presentation/enum/campaign_enum.dart';

import '../../data/model/request/campaign_request.dart';
import '../../data/model/request/create_campaign_request.dart';
import '../../data/model/request/edit_campaign_request.dart';
import '../../data/model/response/campaign_model.dart';
import '../../data/model/response/create_campaign_model.dart';
import '../../data/model/response/edit_campaign_model.dart';
import '../../domain/usecase/campiagn_usecase.dart';
import '../../domain/usecase/create_campaign_usecase.dart';
import '../../domain/usecase/edit_campaign_usecase.dart';
import 'package:get/get.dart';

class CampaignController extends GetxController {
  // constructor
  CampaignController({
    required this.campaignUseCase,
    required this.createCampaignUseCase,
    required this.editCampaignUseCase,
    required this.deleteCampaignUseCase,
  });
  // usecase
  final CampaignUseCase campaignUseCase;
  final CreateCampaignUseCase createCampaignUseCase;
  final EditCampaignUseCase editCampaignUseCase;
  final DeleteCampaignUseCase deleteCampaignUseCase;

  // model
  Rx<CampaignModel> campaignModel = CampaignModel().obs;
  Rx<CreateCampaignModel> createCampaignModel = CreateCampaignModel().obs;
  Rx<EditCampaignModel> editCampaignModel = EditCampaignModel().obs;
  Rx<DeleteCampaignModel> deleteCampaignModel = DeleteCampaignModel().obs;
  // variable
  RxDouble roiVolume = RxDouble(10.00);

  void getCampaign() async {
    CampaignRequest request = const CampaignRequest(size: 5, offset: 10);
    var result = await campaignUseCase(request: request);
    result.fold(
      (failure) => null,
      (data) => campaignModel.value = data,
    );
  }

  void createCampaign() async {
    var request = const CreateCampaignRequest(id: "10");
    var result = await createCampaignUseCase(request: request);
    result.fold(
      (failure) => null,
      (data) => createCampaignModel.value = data,
    );
  }

  void editCampaign() async {
    var request = const EditCampaignRequest(id: "10");
    var result = await editCampaignUseCase(request: request);
    result.fold(
      (failure) => null,
      (data) {
        editCampaignModel.value = data;
      },
    );
  }

  void deleteCampaign() async {
    var request = const DeleteCampaignRequest(id: "10");
    var result = await deleteCampaignUseCase(request: request);
    result.fold(
      (failure) => null,
      (data) {
        deleteCampaignModel.value = data;
      },
    );
  }

  void upRoiVolume(CampaignVolumeEnum value) {
    switch (value) {
      case CampaignVolumeEnum.up:
        roiVolume.value++;
        break;
      case CampaignVolumeEnum.down:
        roiVolume.value--;
        break;
      default:
        roiVolume.value = 0.0;
    }
  }

  @override
  void onInit() {
    // getCampaign();
    super.onInit();
  }
}
