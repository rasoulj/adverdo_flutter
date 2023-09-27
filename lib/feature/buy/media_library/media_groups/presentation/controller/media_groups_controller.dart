import 'package:get/get.dart';

import '../../data/model/request/media_groups_request.dart';
import '../../data/model/response/media_groups_model.dart';
import '../../domain/usecase/media_groups_usecase.dart';
import '../validator/media_groups_validator.dart';

class MediaGroupsController extends GetxController with MediaGroupsValidator, StateMixin<MediaGroupsModel> {
  MediaGroupsController({required this.useCase});

  final MediaGroupsUseCase useCase;


  String? isValidName(String? groupName) {
    if(groupName == null) {
      return "Group Name cannot left empty";
    }
    if(groupName.length < 4) {
      return "Minimum length of group name is 4";
    }

    if(value?.items.map((e) => e.name.toLowerCase()).contains(groupName.toLowerCase()) ?? false) {
      return "'$groupName' already exists, choose different name";
    }

    return null;
  }

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  List<GroupItem> get items => value?.items ?? [];

  void fetch() async {
    MediaGroupsRequest request = const MediaGroupsRequest(
      size: 1,
      request: 2,
    );

    change(null, status: RxStatus.loading());

    var result = await useCase(request: request);

    result.fold(
      (failure) => change(null, status: RxStatus.error("Error loading media libraries")),
      (data) {
        // model.value = data;
        _setData(data);
      },
    );
  }

  void _setData(MediaGroupsModel? model) {
    change(model, status: model == null || model.items.isEmpty ? RxStatus.empty() : RxStatus.success());
  }

  Future<GroupItem?> createGroup(String groupName) async {
    MediaGroupsModel? model = value;
    if(model == null) return null;

    var groupItem = GroupItem(
      id: 1,
      name: groupName,
      status: Status.active,
      creatives: 0,
    );
    model.items.add(groupItem);

    _setData(model);

    return groupItem;
  }

  void deleteGroup(GroupItem item) {
    MediaGroupsModel? model = value;
    if(model == null) return;
    model.items.remove(item);
    _setData(model);
  }
}
