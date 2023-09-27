import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LimitedTextField extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLength;
  final String labelText;
  final FormFieldValidator<String?>? validator;

  const LimitedTextField({
    super.key,
    required this.controller,
    this.maxLength,
    required this.labelText,
    this.validator,
  });

  void updateUI(BuildContext context) => (context as Element).markNeedsBuild();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      onChanged: (String text) {
        updateUI(context);
      },
      decoration: InputDecoration(
        errorStyle: AppDesigns.errorStyle,
        labelText: labelText,
        hintText: labelText,
        suffixIcon: controller.text.isNotEmpty ? IconButton(
          onPressed: () {

            controller.clear();
            updateUI(context);
          },
          icon: const Icon(Icons.clear),
        ) : null,
      ),
    );
  }
}
