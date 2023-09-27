import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';
import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';
import 'package:advedro/feature/buy/media_library/medialibrary/data/datasource/medialibrary_datasource.dart';
import 'package:advedro/feature/buy/media_library/medialibrary/data/datasource/mock/medialibrary_datasource_mock.dart';
import 'package:advedro/feature/buy/media_library/medialibrary/data/model/ad_types_enum.dart';
import 'package:advedro/feature/buy/media_library/medialibrary/data/model/request/request.dart';
import 'package:flutter_test/flutter_test.dart';

class TestClass<T extends ResponseBase> {
  void parse(String str) {}
}

void main() {
  test("dummy", () {
    // ResponseBase resp = const DeleteResponse(result: 'sss');
    expect(1, 1);
  });

  test("Test for MediaLibraryDataSourceMock.fetch", () async {
    var dio = DioClientService();
    MediaLibraryDataSource dataSource = MediaLibraryDataSourceMock(dio: dio);
    var model = await dataSource.fetch(request: const MediaLibraryRequest(id: "56"));

    expect(model.createdAt.toStringAdv(), "2022/08/31 10:22:49");
    expect(model.updatedAt.toStringAdv(), "2023/04/25 09:46:33");
    expect(model.status, "active");
    expect(model.creatives.length, 1);
    expect(model.creatives.first.tags.length, 3);
  });

  test("Test for MediaLibraryDataSourceMock.createAd", () async {
    var dio = DioClientService();
    MediaLibraryDataSource dataSource = MediaLibraryDataSourceMock(dio: dio);
    var model = await dataSource.createAd(
        request: CreateAdRequest(
      adType: AdTypesEnum.native,
      groupId: "56",
      title: "test title",
      body: "test body",
      callToAction: 1,
      brandName: "test brandName",
      tags: ["tag1"],
      images: [],
    ));

    expect(model.id, "605");
    expect(model.result, "Creative creation was successful.");
  });

  test("Test for MediaLibraryDataSource.fetchCallToActions", () async {
    var dio = DioClientService();
    MediaLibraryDataSource dataSource = MediaLibraryDataSourceMock(dio: dio);
    var model = await dataSource.fetchCallToActions(request: const CallToActionsRequest());

    expect(model.actions.length, 23);
    expect(model.actions.first.name, "Apply Now");
    expect(model.actions.last.id, 23);
  });

  test("Test for MediaLibraryDataSource.changeTags", () async {
    var dio = DioClientService();
    MediaLibraryDataSource dataSource = MediaLibraryDataSourceMock(dio: dio);
    var model = await dataSource.changeTags(request: const ChangeTagsRequest(id: "56", tags: ["tag1", "tag2", "tag3"]));

    expect(model.result, "Creative tag changing was successful.");
  });

  test("Test for MediaLibraryDataSource.deleteMediaLibrary", () async {
    var dio = DioClientService();
    MediaLibraryDataSource dataSource = MediaLibraryDataSourceMock(dio: dio);
    var model = await dataSource.deleteMediaLibrary(request: const DeleteRequest(id: "605"));

    expect(model.result, "Creative deleting was successful.");
  });
}
