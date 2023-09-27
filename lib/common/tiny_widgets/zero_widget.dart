import 'package:flutter/material.dart';

/// A widget with dimension zero
class ZeroWidget extends StatelessWidget {
  const ZeroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(dimension: 0,);
  }
}
