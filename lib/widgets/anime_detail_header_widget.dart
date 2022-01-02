import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';

class AnimeDetailHeader extends StatelessWidget {

  final Content featuredAnime;

  const AnimeDetailHeader({Key? key,
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
          stops: [0,0.9]
        )
      ),
      child: SizedBox(
        height: 580,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 430,
                width: double.infinity,
              ),
              Text(
                featuredAnime.title.toUpperCase(),
                style: Theme.of(context).textTheme.headline1,
              ),
              Spacer(),
              Text(
                featuredAnime.description,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.grey.shade500
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Center(child: _KnowMoreButton(featuredAnime: featuredAnime))
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
