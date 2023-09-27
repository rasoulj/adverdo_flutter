import 'package:flutter/material.dart';
import 'package:get/get.dart';



enum ChartTypesEnum {
  spend,
  clicked,
  impressions,
  conversations,
}

class _ChartTypesEnumMeta {
  final Color color;
  final Color selectedColor;
  final String title;

  static const int _intense = 200;

  const _ChartTypesEnumMeta(this.selectedColor, this.color, this.title);

  static Map<ChartTypesEnum, _ChartTypesEnumMeta> all = {
    ChartTypesEnum.spend: _ChartTypesEnumMeta(Colors.yellow, Colors.yellow[_intense]!, "Spend"),
    ChartTypesEnum.clicked: _ChartTypesEnumMeta(Colors.green, Colors.green[_intense]!, "Clicked"),
    ChartTypesEnum.impressions: _ChartTypesEnumMeta(Colors.indigo, Colors.indigo[_intense]!, "Impressions"),
    ChartTypesEnum.conversations: _ChartTypesEnumMeta(Colors.pink, Colors.pink[_intense]!, "Conversations"),
  };
}

class ChartTypeSelector extends StatelessWidget {
  final ChartTypesEnum value;
  final void Function(ChartTypesEnum) onChanged;
  const ChartTypeSelector({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ChartTypesEnum.values.map((e) {
          var data = _ChartTypesEnumMeta.all[e];
          bool selected = e == value;
          return TextButton(
            onPressed: selected ? null : () => onChanged(e),
            child: Row(
              children: [
                Icon(Icons.circle, size: 12, color: selected ? data?.selectedColor : data?.color,),
                const SizedBox(width: 3,),
                Text(data?.title ?? "-", style: Get.textTheme.bodyMedium?.copyWith(
                  color: selected ? Get.iconColor : Colors.grey,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w300
                ),),

              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
