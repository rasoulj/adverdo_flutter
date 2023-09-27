import 'package:advedro/common/common.dart';
import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputUtils {
  InputUtils._();

  /// Show animated [TextFormField] for input text
  ///
  /// Shows an action sheet for input text
  ///
  /// Example:
  /// ```dart
  /// //Show InputUtils.inputText
  /// String? result = await InputUtils.inputText(
  ///   header: const Text("Input value"),
  ///   defaultValue: cnt1.text,
  ///   validator: validateInput,
  ///   decoration: const InputDecoration(
  ///     prefixIcon: Icon(Icons.lock_open, color: Colors.grey),
  ///     hintText: 'New value:',),
  ///   ),
  /// );
  /// if(result != null) {
  ///   print(result);
  /// }
  /// ```
  static Future<String?> inputText({
    /// [header] shown on top of action sheet
    Widget? header,

    /// [defaultValue] of animated [TextFormField]
    String? defaultValue = "",

    /// [keyboardType] used in [TextFormField]
    TextInputType? keyboardType,

    /// [decoration] of [TextFormField]
    InputDecoration decoration = const InputDecoration(),

    /// [validator] for [TextFormField]
    FormFieldValidator<String?>? validator,
  }) async {
    Color bgColor = Get.theme.colorScheme.background;
    final formKey = GlobalKey<FormState>();
    TextEditingController cnt = TextEditingController(text: defaultValue);

    String? result = await Get.bottomSheet<String?>(
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            if (header != null) Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 40,),
          header,
          const CloseButtonDialog<String?>(value: null),
        ],
      ),
            Form(
              key: formKey,
              child: TextFormField(
                validator: validator,
                controller: cnt,
                autofocus: true,
                keyboardType: keyboardType,
                decoration: decoration,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (validator != null) {
                    String? val = validator(cnt.text);
                    if (val != null) {
                      formKey.currentState?.validate();
                      return;
                    }
                  }
                  Get.back(result: cnt.text);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Get.theme.badgeTheme.backgroundColor),
                child: SizedBox(width: Get.width * 0.9, child: Center(child: Text("OK".tr))))
          ],
        ),
      ),
      // elevation: 200,
      shape: const RoundedRectangleBorder(
        borderRadius: AppDesigns.topCircular,
      ),
      backgroundColor: bgColor, //.withOpacity(ui_consts.defaultOpacity),
    );

    return result;
  }

  static Future<int?> select({
    required int length,
    required IndexedWidgetBuilder builder,
    Widget? message,
    Widget? title,
  }) async {
    return await showCupertinoModalPopup<int>(
      context: Get.context!,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: title,
          message: message,
          actions: List.generate(length, (index) =>
              CupertinoActionSheetAction(
                onPressed: () => Get.back(result: index),
                child: builder(context, index),
              ),
          ),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Get.back<int>(result: null),
            child: const Text(
              "Cancel",
            ),
          ),
        );
      },
    );
  }

}


