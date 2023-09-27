import 'package:flutter/material.dart';

import '../../../../../../../../config/asset_resource/images_resource.dart';

class SignUpImageBackground extends StatelessWidget {
  const SignUpImageBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(
        ImagesResource.advedroBackground,
        height: 362.0,
        width: 271.0,
      ),
    );
  }
}
