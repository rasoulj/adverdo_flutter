import 'package:flutter/material.dart';

import '../../../../../../../../../config/asset_resource/images_resource.dart';

class ForgetPasswordLogo extends StatelessWidget {
  const ForgetPasswordLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 52.0,
      left: 31.0,
      child: Image.asset(
        ImagesResource.advedroLogo,
        height: 77.0,
        width: 71.0,
      ),
    );
  }
}
