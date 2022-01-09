import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatelessWidget {

  bool checked = false;
  final ValueChanged<bool> valueChanged;
  CheckboxWidget({
    Key? key,
    required this.checked,
    required this.valueChanged,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: MyShapes.checkboxBorders
      ),
      value: checked,
      onChanged: (bool? value) {
        valueChanged(value ?? false);
        checked = value!;
      }
    );
  }
}