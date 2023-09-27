import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';

class ImageThumbnail extends StatelessWidget {
  final ImageProvider image;

  const ImageThumbnail({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(

          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(AppDesigns.defaultRadius)),
              image: DecorationImage(
                fit: BoxFit.fill,
                alignment: FractionalOffset.center,
                image: image,
              )
          ),
        ),
      ),);
  }
}
