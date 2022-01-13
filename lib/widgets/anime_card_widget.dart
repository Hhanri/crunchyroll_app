import 'package:cached_network_image/cached_network_image.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/providers/firestore_provider.dart';
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
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: Center(
                child: GetImageWidget(imagePath: featuredAnime.imageURL,)
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4),
                child: SizedBox(
                  child: Text(
                    featuredAnime.title,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline3,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
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
                        print(featuredAnime.imageURL);
                      },
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

