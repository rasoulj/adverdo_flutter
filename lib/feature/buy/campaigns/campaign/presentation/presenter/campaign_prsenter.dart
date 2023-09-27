import '../../../../../../config/consts/consts.dart';
import '../../data/model/response/campaign_model.dart';

class CampaignPresenter {
  int id = 0;
  String name = string;
  String status = string;
  // campaign_presenter
  CampaignPresenter(Item? items) {
    name = items?.name ?? string;
    id = items?.id ?? 0;
    status = items?.status ?? string;
  }
}
