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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Colors.transparent,
            MyColors.backgroundColor
          ],
          stops: const [0,0.9]
        )
      ),
      child: SizedBox(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 6
              ),
              Expanded(
                flex: 1,
                child: Text(
                  featuredAnime.title.toUpperCase(),
                  style: Theme.of(context).textTheme.headline1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    featuredAnime.description,
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              const _PlayButtonWidget()
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
        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(5, 0, 15, 0)),
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
