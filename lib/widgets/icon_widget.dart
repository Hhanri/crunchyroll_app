import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  final double? size;
  final IconData icon;

  const IconWidget({
    Key? key,
    required this.icon,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
        icon,
        size: size ?? 33,
        color: MyColors.iconColor
    );
  }
}