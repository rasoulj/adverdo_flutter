import 'dart:ui';

import 'package:advedro/core/data/enums/select_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

/// Permissions options when asking for different types of permissions
class _Option {
  final String caption;
  final String title;
  final String subtitle;
  final IconData icon;

  _Option(this.caption, this.title, this.subtitle, this.icon);

  static final Map<SelectPhotoEnum, _Option> all = {
    SelectPhotoEnum.gallery: _Option(
      "Gallery",
      "Access to Gallery",
      "Adverdo currently doesn't have access to use your Gallery; you can change this in the settings",
      Icons.photo_outlined,
    ),
    SelectPhotoEnum.camera: _Option(
      "Camera",
      "Access to Camera",
      "Adverdo currently doesn't have access to use your Camera; you can change this in the settings",
      Icons.photo_camera_outlined,
    ),
    SelectPhotoEnum.contacts: _Option(
      "Contacts",
      "Access to Contacts",
      "Adverdo currently doesn't have access to use your Contacts; you can change this in the settings",
      Icons.contacts,
    ),
  };
}

class PermissionUtils {
  PermissionUtils._();

  /// Prompts users to grant access to image source in [option]
  static Future<bool?> openPermissionSettings(SelectPhotoEnum option) async {
    Color accent = Get.theme.colorScheme.secondary;
    _Option o = _Option.all[option]!;
    return await showCupertinoModalPopup<bool>(
        context: Get.context!,
        filter: ImageFilter.blur(),
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(35)),
              color: (Get.isDarkMode ? Colors.black : Colors.white).withAlpha(220),
            ),
            height: Get.height / 2,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () => Get.back(result: false),
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: accent),
                            )),
                        Text(
                          o.caption,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.transparent),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Icon(
                        o.icon,
                        size: 100,
                        color: accent,
                      ),
                    ),
                    Text(
                      o.title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      o.subtitle,
                      style: TextStyle(
                        color: accent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 34),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: accent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: openAppSettings,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("Go to Settings"),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
