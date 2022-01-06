import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/utils/route_generator.dart';
import 'package:crunchyroll_app/utils/router.gr.dart';
import 'package:crunchyroll_app/widgets/anime_card_widget.dart';
import 'package:crunchyroll_app/widgets/content_header_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  //final List<HomeList> homePlaylist;

  const HomeScreen({Key? key,
  //  required this.homePlaylist,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<HomeList>_homePlaylists = homePlaylists;
  
  @override
  Widget build(BuildContext homeContext) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            trendingAnime.imageURL,
            fit: BoxFit.cover,
          ),
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
                        ...List.generate(_homePlaylists.length, (index) {
                          return HomeListWidget(
                            listTitle: _homePlaylists[index].listTitle,
                            animeList: _homePlaylists[index].animes
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

    const double _listViewHeight = 380;//AppConfig.heightScreen(context)*(5/9);

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
                return TextButton(
                  onPressed: () {
                    context.router.push(
                      AnimeRouter(
                        featuredAnimeArgument: animeContent
                      )
                    );
                    /*Navigator.of(context).pushNamed(
                        ANIME_DETAIL_PAGE,
                        arguments: animeContent
                     );
                     */

                  },
                  child: AnimeCardWidget(
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



