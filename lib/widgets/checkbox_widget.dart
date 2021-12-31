import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {

  bool checked = false;
  final ValueChanged<bool> valueChanged;
  CheckboxWidget({
    Key? key,
    required this.checked,
    required this.valueChanged,
  }) : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: RoundedRectangleBorder(
            borderRadius: MyShapes.checkboxBorders
        ),
        value: widget.checked,
        onChanged: (bool? value) {
          setState(() {
            widget.valueChanged(value ?? false);
            widget.checked = value!;
          });
        }
    );
  }
}