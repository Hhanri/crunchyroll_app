import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:crunchyroll_app/utils/format_utils.dart';


class HomeListWidget extends StatelessWidget {

  final String listTitle;
  final List<AnimeContent> animeList;

  const HomeListWidget({Key? key,
    required this.listTitle,
    required this.animeList,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                listTitle,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 274,
          child: ListView.builder(
            //shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 0
            ),
            scrollDirection: Axis.horizontal,
            itemCount: animeList.length,
            itemBuilder: (BuildContext context, int index) {
              final AnimeContent animeContent = animeList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ANIME_DETAIL_PAGE,
                    arguments: animeContent
                  );
                },
                child: _AnimeCardWidget(featuredAnime: animeContent),
              );
            },
          ),
        )
      ],
    );
  }
}




class _AnimeCardWidget extends StatelessWidget {
  final AnimeContent featuredAnime;
  const _AnimeCardWidget({
    Key? key,
    required this.featuredAnime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            featuredAnime.getAnimeThumbail(),
            width: 139,
            height: 208,
          ),
          Container(
            width: 139,
            height: 50,
            color: MyColors.containerColor,
            child: Center(
              child: Text(
                featuredAnime.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
