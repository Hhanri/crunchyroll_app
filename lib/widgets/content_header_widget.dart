import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';

class ContentHeaderWidget extends StatelessWidget {
  final Content featuredAnime;
  const ContentHeaderWidget({Key? key,
    required this.featuredAnime
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            MyColors.backgroundColor
          ],
          stops: [0,0.95]
        )
      ),
      child: SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
              ),
              Text(
                featuredAnime.title.toUpperCase(),
                style: Theme.of(context).textTheme.headline1,
              ),
              Spacer(),
              Text(
                featuredAnime.description,
                style: Theme.of(context).textTheme.bodyText1,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              Spacer(),
              _PlayButtonWidget()
            ],
          ),
        ),
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
