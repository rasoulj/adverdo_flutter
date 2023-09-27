import 'dart:ui';

import 'package:advedro/common/common.dart';
import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Ask {

  static Future<bool?> question(String question, {
    String title = "Question",
    String yesText = "Yes",
    String noText = "No",
  }) async {
    Color accent = Get.theme.colorScheme.secondary;

    return await showCupertinoModalPopup<bool>(
        context: Get.context!,
        filter: ImageFilter.blur(),
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: AppDesigns.topCircular,
              color: (Get.isDarkMode ? Colors.black : Colors.white), //.withAlpha(220),
            ),
            height: Get.height / 4,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 40,),
                        Text(
                          title,
                          //style: Get.textTheme.titleSmall,
                        ),
                        const CloseButtonDialog<bool>(value: false),
                      ],
                    ),
                    Text(
                      question,
                      style: Get.textTheme.titleLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(child: ZeroWidget()),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              backgroundColor: Get.theme.buttonTheme.colorScheme?.background,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () => Get.back(result: true),
                            child: Text(yesText),
                          ),
                        ),
                        const Expanded(child: ZeroWidget()),
                        Expanded(
                          flex: 3,
                          child: TextButton(
                            onPressed: () => Get.back(result: false),
                            child: Text(noText),
                          ),
                        ),
                        const Expanded(child: ZeroWidget()),
                      ],
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

}