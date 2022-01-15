import 'package:auto_size_text/auto_size_text.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/know_more_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeDetailHeader extends StatelessWidget {

  final AnimeContent featuredAnime;

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
          stops: [0,0.9]
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
                child: AutoSizeText(
                  featuredAnime.title.toUpperCase(),
                  style: Theme.of(context).textTheme.headline1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: AutoSizeText(
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

  final AnimeContent featuredAnime;

  const _KnowMoreButton({Key? key,
    required this.featuredAnime
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Get.to(() => KnowMoreScreen(featuredAnimeArgument: featuredAnime));
      },
      label: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: MyColors.primaryColor
      ),
      icon: Text(
        Strings.knowMoreTitle,
        style: Theme.of(context).textTheme.headline1!.copyWith(
          color: MyColors.primaryColor
        ),
      ),
    );
  }
}

