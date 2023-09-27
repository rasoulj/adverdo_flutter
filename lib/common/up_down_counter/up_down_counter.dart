import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UpDownCounter extends StatelessWidget {

  /// If non-null, add a prefix to start of the widget
  final Widget? prefix;

  /// Current [value] of the [UpDownCounter]
  final double value;

  /// Value of [increment] in each Up or Down action
  final double increment;

  /// Maximum value of [value], its default value is set to 100.0
  final double maxValue;

  /// Minimum value of [value], its default value is set to 0.0
  final double minValue;

  /// [onChanged] a void call-back, that executes when-ever value changed
  final void Function(double)? onChanged;

  /// Creates an instance of [UpDownCounter]
  ///
  /// [prefix], If non-null, add a prefix to start of the widget
  /// Value of [increment] in each Up or Down action
  /// Maximum value of [value], its default value is set to 100.0
  /// Minimum value of [value], its default value is set to 0.0
  /// [onChanged] a void call-back, that executes when-ever value changed
  const UpDownCounter({
    Key? key,
    this.prefix,
    this.increment = 1.0,
    required this.value,
    this.maxValue = 100.0,
    this.minValue = 0.0,
    this.onChanged,
  }) :
        assert(minValue < maxValue, "maxValue must be greater that minValue"),
        assert(increment > 0, "increment must be greater that zero"),
        assert(value >= minValue && value <= maxValue, "value must lay between minValue and maxValue"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor = Get.theme.colorScheme.background;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDesigns.defaultRadius),
        color: bgColor.withOpacity(AppDesigns.defaultOpacity),
      ),
      child: Row(
        children: [
          if(prefix != null) Expanded(child: Center(child: prefix!)),
          Expanded(flex: 2, child: Container(
            color: bgColor,
            child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(onPressed: (){}, child: Text(value.toString()))),
          ),),
          Expanded(flex: 1, child: Center(
            child: TextButton(
              onPressed: _canDown ? _downPressed : null,
              child: const Icon(Icons.keyboard_arrow_down),),
          ),
          ),
          Expanded(flex: 1, child: Center(
            child: TextButton(
              onPressed: _canUp ? _upPressed : null,
              child: const Icon(Icons.keyboard_arrow_up),),
          ),
          ),
        ],
      ),
    );
  }

  bool get _canUp => onChanged != null && value + increment <= maxValue;
  bool get _canDown => onChanged != null && value - increment >= minValue;

  void _upPressed() {
    onChanged!(value+increment);
  }

  void _downPressed() {
    onChanged!(value-increment);
  }
}
