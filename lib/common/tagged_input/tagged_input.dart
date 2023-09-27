
import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

import 'inner_tags_view.dart';
import 'options_view.dart';
import 'tagged_input_styles.dart';



const String _hint = "Tags (Comma Seperated)";

class TaggedInput extends StatelessWidget {
  final List<String> tags;
  final List<String> initialTags;
  final TextfieldTagsController controller;

  const TaggedInput({
    super.key,
    this.tags = const [],
    this.initialTags = const [],
    required this.controller,
  });


  Widget? get _suffixIcon => controller.hasTags ? IconButton(onPressed: controller.clearTags, icon: const Icon(Icons.close)) : null;

  String? validator(String tag) {
    if (tag.length < 3) {
      return 'Minimum length of tag is 3';
    } else if (controller.getTags?.contains(tag) ?? false) {
      return 'you already entered that';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsViewBuilder: (context, onSelected, options) {
        return OptionsView(options: options, onSelected: onSelected);
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return tags.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selectedTag) {
        controller.addTag = selectedTag;
      },
      fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(_hint),
            TextFieldTags(
              textEditingController: ttec,
              focusNode: tfn,
              textfieldTagsController: controller,
              initialTags: initialTags,
              textSeparators: const [' ', ','],
              letterCase: LetterCase.normal,
              validator: validator,
              inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
                return ((context, sc, tags, onTagDelete) {
                  return TextField(
                    controller: tec,
                    focusNode: fn,
                    decoration: InputDecoration(
                      suffixIcon: _suffixIcon,
                      errorStyle: AppDesigns.errorStyle,
                      //border: TaggedInputStyles.border,
                      //focusedBorder: TaggedInputStyles.border,
                      //labelText: "Tags (Comma Seperated)",
                      helperText: !controller.hasTags ? "" : "",
                      hintText: controller.hasTags ? '' : "Enter tags...",
                      errorText: error,
                      prefixIconConstraints: TaggedInputStyles.constraints,
                      prefixIcon: !controller.hasTags ? null : SingleChildScrollView(
                        controller: sc,
                        scrollDirection: Axis.horizontal,
                        child: InnerTagsView(tags: tags, onTagDelete: onTagDelete,),
                      ),
                    ),
                    onChanged: onChanged,
                    onSubmitted: onSubmitted,
                  );
                });
              },
            ),
          ],
        );
      },
    );
  }

}
