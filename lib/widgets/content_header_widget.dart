import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';

class ContentHeaderWidget extends StatelessWidget {
  const ContentHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
          ),
          Text(
            "KIMETSU NO YAIBA",
            style: Theme.of(context).textTheme.headline1,
          ),
          Spacer(),
          Text(
            "une tres longue description",
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          Spacer(),
          _PlayButtonWidget()
        ],
      ),
    );
  }
}

class _PlayButtonWidget extends StatelessWidget {
  const _PlayButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(5, 0, 15, 0)),
      ),
      onPressed: () {
        print("play");
      },
      icon: const Icon(
        Icons.play_arrow_outlined,
        size: 30,
        color: Colors.black,
      ),
      label: Text(
        "PLAY",
        style: Theme.of(context).textTheme.headline1!.copyWith(
          color: Colors.black
        ),
      )
    );
  }
}
