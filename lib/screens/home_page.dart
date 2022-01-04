import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/utils/format_utils.dart';
import 'package:crunchyroll_app/utils/route_generator.dart';
import 'package:crunchyroll_app/widgets/content_header_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final List<HomeList> homePlaylist;

  const HomeScreen({Key? key,
    required this.homePlaylist,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext homeContext) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(trendingAnime.imageURL),
          SingleChildScrollView(
            child: Column(
              children: [
                ContentHeaderWidget(
                  featuredAnime: trendingAnime,
                ),
                Container(
                  constraints: BoxConstraints(
                    minHeight: AppConfig.heightScreen(context),
                    minWidth: AppConfig.widthScreen(context)
                  ),
                  decoration: const BoxDecoration(
                    color: MyColors.backgroundColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10
                    ),
                    child: Column(
                      children: <HomeListWidget>[
                        ...List.generate(widget.homePlaylist.length, (index) {
                          return HomeListWidget(
                            listTitle: widget.homePlaylist[index].listTitle,
                            animeList: widget.homePlaylist[index].animes
                          );
                        })
                      ],
                    ),
                  ),
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}

class HomeListWidget extends StatelessWidget {

  final String listTitle;
  final List<AnimeContent> animeList;

  const HomeListWidget({Key? key,
    required this.listTitle,
    required this.animeList,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              listTitle,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: 316,
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
      ),
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
      decoration: BoxDecoration(
        color: MyColors.containerColor
      ),
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              featuredAnime.getAnimeThumbail(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                featuredAnime.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
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
