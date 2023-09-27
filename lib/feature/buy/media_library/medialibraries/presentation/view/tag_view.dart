import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';

class TagView extends StatelessWidget {
  final String tag;
  const TagView({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      visualDensity: VisualDensity.compact,
      backgroundColor: Colors.grey[200],
      elevation: 1,
      shape: AppDesigns.getCircularBorder(radius: 8),
      label: Text(tag, style: TextStyle(color: Colors.grey[600]),),
    );
  }
}
