import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';

class AnimeCardWidget extends StatelessWidget {
  final double listViewHeight;
  final AnimeContent featuredAnime;
  const AnimeCardWidget({
    Key? key,
    required this.featuredAnime,
    required this.listViewHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          color: MyColors.containerColor
      ),
      width: ((listViewHeight-16)/960)*640*(10/13), // ((SizedBoxHeight - padding) / imageHeight) * imageWidth * (imageFlex / (imageFlex+textFlex))
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 10,
            child: Center(
              child: Image.asset(
                featuredAnime.imageURL,
                fit: BoxFit.contain,//getAnimeThumbail(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4),
              child: Text(
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
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