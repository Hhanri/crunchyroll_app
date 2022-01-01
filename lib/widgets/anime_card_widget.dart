import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:crunchyroll_app/resources/strings.dart';

class AnimeCardWidget extends StatefulWidget {
  const AnimeCardWidget({Key? key}) : super(key: key);

  @override
  _AnimeCardWidgetState createState() => _AnimeCardWidgetState();
}

class _AnimeCardWidgetState extends State<AnimeCardWidget> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImagePath.thumbnail),
          Container(
            height: 70,
            alignment: Alignment.center,
            width: double.infinity,
            color: MyColors.containerColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Kimetsu no Yaiba",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
