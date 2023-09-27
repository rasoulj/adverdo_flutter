import 'package:advedro/common/common.dart';
import 'package:flutter/widgets.dart';

class _Row2 extends StatelessWidget {
  final Widget? child1;
  final Widget? child2;
  const _Row2({
    Key? key,
    this.child1,
    this.child2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: ZeroWidget()),
        Expanded(flex: 4, child: child1 ?? const ZeroWidget()),
        const Expanded(child: ZeroWidget()),
        Expanded(flex: 4, child: child2 ?? const ZeroWidget()),
        const Expanded(child: ZeroWidget()),
      ],
    );
  }
}

class AniWizardWidgetInfo {
  final Duration duration;
  final String? text;
  final Widget? widget;
  final double height;

  final Widget? button1;
  final Widget? button2;

  double get _h => widget == null && text == null ? 0 : height;
  Widget get title => AnimatedContainer(
    height: _h,
    duration: duration,
    child: widget == null && text == null ? const ZeroWidget() : widget ?? Text(text!),
  );
  Widget get buttons => button1 == null && button2 == null ? const ZeroWidget() : _Row2(
    child1: button1,
    child2: button2,
  );

  Widget get view => Column(
    children: [
      title,
      buttons,
    ],
  );

  const AniWizardWidgetInfo({
    this.duration = const Duration(milliseconds: 150),
    this.text,
    this.widget,
    this.height = 20,
    this.button1,
    this.button2,
  });
}
