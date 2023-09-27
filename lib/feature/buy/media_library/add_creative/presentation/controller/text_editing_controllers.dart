import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textfield_tags/textfield_tags.dart';

class TextEditingControllers {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Rx<String?> _applyNow = Rxn<String>();
  String? get applyNow => _applyNow.value;
  set applyNow(String? value) => _applyNow.value = value;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextfieldTagsController tagsController = TextfieldTagsController();

  void disposeTextEditingControllers() {
    titleController.dispose();
    bodyController.dispose();
    brandNameController.dispose();
    tagsController.dispose();
  }


  bool validateTextEditingControllers() {
    return formKey.currentState!.validate();
  }

  void clearTextEditingControllers() {
    applyNow = null;
    titleController.clear();
    bodyController.clear();
    brandNameController.clear();
    tagsController.clearTags();
  }

}