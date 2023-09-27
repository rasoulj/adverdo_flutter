import 'package:advedro/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotchedButtonBar extends StatelessWidget {
  final List<Widget> children;
  final double height;
  const NotchedButtonBar({Key? key, required this.children, this.height = kBottomNavigationBarHeight}) : assert(
    children.length % 2 == 1, "Widgets gets odd number of children"
  ), super(key: key);

  Widget get _center => children.elementAt((children.length/2).floor());
  List<Widget> get _childrenNoCenter  {
    final center = _center;
    return children.map((e) => e == center ? const ZeroWidget() : e).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              const Expanded(child: ZeroWidget()),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent.withOpacity(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _childrenNoCenter,
                  ),
                ),
              ),
            ],
          ),
          CircleAvatar(
              radius: 24,
              backgroundColor: Get.theme.cardColor,
              child: CircleAvatar(
                backgroundColor: Get.theme.colorScheme.secondary,
                  radius: 20,
                  child: _center,
              ),
          ),
        ],
      ),
    );
  }
}
