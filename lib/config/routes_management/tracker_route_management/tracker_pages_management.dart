import 'package:advedro/config/routes_management/tracker_route_management/tracker_routes.dart';
import 'package:get/get.dart';

import '../../../feature/buy/temp/presentation/view/temp_page.dart';

class Pages {
  static final pages = <GetPage>[
    GetPage(
      name: TrackerRoutes.home,
      page: () => const TempPage(),
    ),
  ];
}
