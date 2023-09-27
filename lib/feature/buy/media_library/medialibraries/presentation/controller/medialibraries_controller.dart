import 'package:advedro/feature/buy/media_library/medialibraries/data/model/enums/ad_status_enum.dart';
import 'package:advedro/feature/buy/media_library/medialibrary/data/model/ad_types_enum.dart';
import 'package:get/get.dart';

import '../../data/model/request/medialibraries_request.dart';
import '../../data/model/response/medialibraries_model.dart';
import '../../domain/usecase/medialibraries_usecase.dart';
import '../validator/medialibraries_validator.dart';


const String all = "all";

class ToggleRxSet<E> {
  final RxSet<E> set;
  final List<E> all;

  ToggleRxSet(this.set, this.all);

  void call(E value) {
    E first = all.first;

    if(value == first) {
      set.clear();
      set.add(value);
    } else {
      if (set.contains(value)) {
        set.remove(value);
        if(set.isEmpty) {
          set.add(first);
        }
      } else {
        set.add(value);
        if(set.contains(first)) {
          set.remove(first);
        }
        if(set.length == all.length - 1) {
          set.clear();
          set.add(first);
        }
      }
    }
  }
}

class MediaLibrariesController extends GetxController with MediaLibrariesValidator, StateMixin<MediaLibrariesModel> {
  MediaLibrariesController({required this.useCase});


  final Rx<AdTypesEnum> _adTypeFilter = AdTypesEnum.all.obs;
  AdTypesEnum get adTypeFilter => _adTypeFilter.value;
  set adTypeFilter(AdTypesEnum value) => _adTypeFilter.value = value;

  final RxSet<AdStatusEnum> _adStatusFilter = <AdStatusEnum>{AdStatusEnum.all}.obs;
  Set<AdStatusEnum> get adStatusFilter => _adStatusFilter.value;
  void toggleAdStatus(AdStatusEnum value) {
      final toggle = ToggleRxSet(_adStatusFilter, AdStatusEnum.values);
      toggle(value);
  }

  final RxSet<String> _tagsFilter = <String>{all}.obs;
  Set<String> get tagsFilter => _tagsFilter.value;
  void toggleTagsFilter(String value) {
    final toggle = ToggleRxSet<String>(_tagsFilter, tags);
    toggle(value);
  }

  List<String> get tags {
    Set<String> tt = {};
    for(final p in value?.creatives ?? <Creative>[]) {
      tt.addAll(p.tags);
    }
    var ret = tt.toList();
    ret.insert(0, all);
    return ret;
  }

  final MediaLibrariesUseCase useCase;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  void fetch() async {
    MediaLibrariesRequest request = const MediaLibrariesRequest(
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
