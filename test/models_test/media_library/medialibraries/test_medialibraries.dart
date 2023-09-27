import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';
import 'package:advedro/feature/buy/media_library/media_groups/data/datasource/media_groups_datasource.dart';
import 'package:advedro/feature/buy/media_library/media_groups/data/datasource/mock/media_groups_datasource_mock.dart';
import 'package:advedro/feature/buy/media_library/media_groups/data/model/request/media_groups_request.dart';
import 'package:advedro/feature/buy/media_library/medialibraries/data/datasource/medialibraries_datasource.dart';
import 'package:advedro/feature/buy/media_library/medialibraries/data/datasource/mock/medialibraries_datasource_mock.dart';
import 'package:advedro/feature/buy/media_library/medialibraries/data/model/request/medialibraries_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test for  MediaGroupsModel", () async {
    var dio = DioClientService();
    MediaGroupsDataSource dataSource = MediaGroupsDataSourceMock(dio: dio);
    var model = await dataSource.fetch(request: const MediaGroupsRequest(size: 5, request: 15));

    expect(model.items.length, 31);
    expect(model.total, 36);
    expect(model.items.last.name, "timestamp_test");
  });

  test("Test for MediaLibrariesModel", () async {
    var dio = DioClientService();
    MediaLibrariesDataSource dataSource = MediaLibrariesDataSourceMock(dio: dio);
    var model = await dataSource.fetch(request: const MediaLibrariesRequest(size: 5, request: 15));

    expect(model.creatives.length, 1);
    expect(model.name, "Group 1");
    expect(model.status, "active");
  });

}
