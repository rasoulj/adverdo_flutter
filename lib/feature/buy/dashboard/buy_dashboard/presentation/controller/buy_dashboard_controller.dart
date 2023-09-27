import 'package:advedro/feature/buy/dashboard/buy_dashboard/presentation/view/widgets/chat_type_selector.dart';
import 'package:get/get.dart';

import '../../data/model/request/buy_dashboard_request.dart';
import '../../data/model/response/buy_dashboard_model.dart';
import '../../domain/usecase/buy_dashboard_usecase.dart';
import '../validator/buy_dashboard_validator.dart';

class BuyDashboardController extends GetxController with BuyDashboardValidator, StateMixin<BuyDashboardModel> {
  BuyDashboardController({required this.useCase});

  final BuyDashboardUseCase useCase;

  final Rx<ChartTypesEnum> _chartType = ChartTypesEnum.spend.obs;
  ChartTypesEnum get chartType => _chartType.value;
  set chartType(ChartTypesEnum value) => setChartType(value);
  void setChartType(ChartTypesEnum value) {
    _chartType.value = value;
    update();
  }

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  void fetch() async {
    BuyDashboardRequest request = const BuyDashboardRequest(
      size: 1,
      request: 2,
    );

    change(null, status: RxStatus.loading());

    var result = await useCase(request: request);

    result.fold(
      (failure) => change(null, status: RxStatus.error("Error loading media libraries")),
      (data) {
        // model.value = data;
        change(data, status: RxStatus.success());
      },
    );
  }
}
