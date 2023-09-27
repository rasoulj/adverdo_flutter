import 'package:flutter/material.dart';

/// A simple wrapper for [Row] with maximum 3 children
class Row3 extends StatelessWidget {
  /// First child
  final Widget? child1;

  /// Second child
  final Widget? child2;

  /// Third child
  final Widget? child3;

  const Row3({Key? key, this.child1, this.child2, this.child3})
      : assert(child1 != null || child2 != null || child3 != null, "At least one non-null child must be provided"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (child1 != null) child1!,
            if (child2 != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: child2,
              ),
          ],
        ),
        if (child3 != null) child3!,
      ],
    );
  }
}
