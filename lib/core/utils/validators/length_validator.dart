import 'package:flutter/material.dart';

FormFieldValidator<String?> lengthValidator(int length, [String message = "Minimum length is "]) {
  return (String? text) {
    return (text == null || text.length < length) ? message : null;
  };
}