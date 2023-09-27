import 'dart:typed_data';

import 'package:advedro/common/common.dart';
import 'package:advedro/config/asset_resource/images_resource.dart';
import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreativeImage extends StatelessWidget {
  final String? path;
  const CreativeImage({Key? key, this.path}) : super(key: key);

  String get _url => 'https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg';
  // String get _url => 'https://www.asriran.com/files/fa/news/1402/3/16/1581757_770.jpg';
  // String get _url => 'https://www.asriran.com/files/fa/news/1402/3/16/1581777_632.jpg';


  void test() async {
    var dec = await decodeImageFromList(Uint8List(40));
    
  }

  @override
  Widget build(BuildContext context) {

    return const Padding(
      padding: EdgeInsets.all(5.0),
      child: ImageThumbnail(
        //TODO: image: NetworkImage(_url),
        image: AssetImage(ImagesResource.vina),
      ),
    );
  }
  
}
