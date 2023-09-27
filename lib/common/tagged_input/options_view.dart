import 'package:flutter/material.dart';

class OptionsView extends StatelessWidget {

  final Iterable<String> options;
  final void Function(String) onSelected;

  const OptionsView({Key? key, required this.options, required this.onSelected}) : super(key: key);

  Widget _renderOption(String option) => TextButton(
    onPressed: () {
      onSelected(option);
    },
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(option,),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        elevation: 4.0,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final String option = options.elementAt(index);
              return _renderOption(option);
            },
          ),
        ),
      ),
    );
  }
}
