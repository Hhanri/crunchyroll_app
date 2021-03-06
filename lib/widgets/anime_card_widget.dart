import 'package:auto_size_text/auto_size_text.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';

import 'get_image_widget.dart';

class AnimeCardWidget extends StatelessWidget {
  final AnimeContent featuredAnime;
  const AnimeCardWidget({
    Key? key,
    required this.featuredAnime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.containerColor
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: Center(
              child: GetImageWidget(
                imagePath: featuredAnime.imageURL,
                cardType: CardType.animeCard
              )
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4),
              child: AutoSizeText(
                featuredAnime.title,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline3,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(
                  flex: 5
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    icon: const Icon(
                      Icons.more_vert
                    ),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}

