import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/dimension/dimension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.suffixOnTap,
    this.suffixIcon,
    this.errorText,
    this.onChanged,
    this.obscureText,
    this.padding,
  });

  final VoidCallback? suffixOnTap;
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String labelText;
  final Widget? suffixIcon;
  final String? errorText;
  final Function? onChanged;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        controller: controller,
        maxLines: 1,
        style: Get.theme.textTheme.bodySmall,
        textAlignVertical: TextAlignVertical.bottom,
        onChanged: (String? value) => onChanged == null ? () {} : onChanged!(value),
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText,
          errorStyle: Get.textTheme.labelSmall,
          contentPadding: const EdgeInsets.only(bottom: 4.0),
          constraints: BoxConstraints(
            maxHeight: 64.0,
            minHeight: 49.0,
            maxWidth: Dimensions.width(context),
          ),
          enabled: true,
          labelStyle: errorText == null
              ? Get.textTheme.bodySmall
              : Get.textTheme.bodySmall?.copyWith(
                  color: Get.theme.colorScheme.error,
                ),
          suffixIcon: InkWell(
            onTap: suffixOnTap,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: suffixIcon,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Get.theme.primaryColor),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Get.theme.colorScheme.error),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Get.theme.primaryColorDark),
          ),
          alignLabelWithHint: false,
        ),
      ),
    );
  }
}
