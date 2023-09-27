import 'package:advedro/feature/buy/auth/signup/presentation/controller/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpTextField extends GetView<VerificationController> {
  const OtpTextField({
    super.key,
    required this.textEditingController,
    this.errorText,
    this.onChanged,
    this.textInputAction,
    this.focusNode,
  });

  final TextEditingController textEditingController;
  final String? errorText;
  final Function? onChanged;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49.0,
      width: 36.0,
      child: TextField(
        style: Get.theme.textTheme.bodySmall,
        controller: textEditingController,
        textAlign: TextAlign.center,
        textInputAction: textInputAction,
        keyboardType: TextInputType.number,
        textAlignVertical: TextAlignVertical.center,
        focusNode: focusNode,
        onChanged: onChanged == null ? (String value) {} : (String value) => onChanged!(value),
        decoration: InputDecoration(
          errorStyle: Get.textTheme.labelSmall,
          contentPadding: const EdgeInsets.only(bottom: 8.0),
          constraints: const BoxConstraints(maxHeight: 49.0, minHeight: 49.0, maxWidth: 36.0, minWidth: 36.0),
          enabledBorder: errorText == null ? UnderlineInputBorder(borderSide: BorderSide(color: Get.theme.primaryColor)) : UnderlineInputBorder(borderSide: BorderSide(color: Get.theme.colorScheme.error)),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Get.theme.colorScheme.error)),
          focusedBorder: errorText == null ? UnderlineInputBorder(borderSide: BorderSide(color: Get.theme.primaryColorDark)) : UnderlineInputBorder(borderSide: BorderSide(color: Get.theme.colorScheme.error)),
        ),
      ),
    );
  }
}
