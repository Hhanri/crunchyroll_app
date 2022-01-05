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

    final double _listViewHeight =  380;//AppConfig.heightScreen(context)*(5/9);

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
            height: _listViewHeight,
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
                  child: _AnimeCardWidget(
                    featuredAnime: animeContent,
                    listViewHeight: _listViewHeight,
                  ),
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
  final double listViewHeight;
  final AnimeContent featuredAnime;
  const _AnimeCardWidget({
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
            child: Image.asset(
              featuredAnime.getAnimeThumbail(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4),
              child: Column(
                children: [
                  Text(
                    featuredAnime.title,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline3,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    iconSize: 20,
                    icon: Icon(
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
