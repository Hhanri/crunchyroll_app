import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/route_generator.dart';
import 'package:flutter/material.dart';

class AnimeDetailHeader extends StatelessWidget {

  final Content featuredAnime;

  const AnimeDetailHeader({Key? key,
    required this.featuredAnime
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            MyColors.backgroundColor
          ],
          stops: const [0,0.9]
        )
      ),
      child: SizedBox(
        height: 570,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 7,
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
                flex: 1,
                child: Center(
                  child: Text(
                    featuredAnime.description,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.grey.shade500
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: _KnowMoreButton(
                    featuredAnime: featuredAnime
                  )
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _KnowMoreButton extends StatelessWidget {

  final Content featuredAnime;

  const _KnowMoreButton({Key? key,
    required this.featuredAnime
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.of(context).pushNamed(KNOW_MORE_PAGE, arguments: featuredAnime);
      },
      label: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: MyColors.primaryColor
      ),
      icon: Text(
        "En savoir plus",
        style: Theme.of(context).textTheme.headline1!.copyWith(
          color: MyColors.primaryColor
        ),
      ),
    );
  }
}

