import 'package:flutter/material.dart';

import 'tagged_input_styles.dart';

class InnerTagsView extends StatelessWidget {
  final List<String> tags;
  final void Function(String) onTagDelete;
  const InnerTagsView({Key? key, required this.tags, required this.onTagDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: tags.map((String tag) {
          return _renderTag(tag);
        }).toList());
  }

  Widget _renderTag(String tag) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: TaggedInputStyles.primary,
      ),
      margin:
      const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Text(
              tag,
              style: const TextStyle(
                  color: Colors.white),
            ),
            onTap: () {
              //print("$tag selected");
            },
          ),
          const SizedBox(width: 4.0),
          InkWell(
            child: const Icon(
              Icons.cancel,
              size: 14.0,
              color: Colors.white,
            ),
            onTap: () {
              onTagDelete(tag);
            },
          )
        ],
      ),
    );
  }
}
