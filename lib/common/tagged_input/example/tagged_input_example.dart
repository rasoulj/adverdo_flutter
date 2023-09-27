import 'package:advedro/core/utils/dev_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../tagged_input.dart';

void main() {
  final controller = TextfieldTagsController();
  runApp(ExampleRunner(isDark: false, child: TaggedInput(
    tags: const ["Tag 1", "Tag 2", "Tag 3"],
    initialTags: const ["Tag 4", "Tag 5"],
    controller: controller,
  )));
}


