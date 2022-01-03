import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/widgets/anime_card_widget.dart';
import 'package:crunchyroll_app/widgets/content_header_widget.dart';
import 'package:crunchyroll_app/widgets/home_list_widget.dart';
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
    return Stack(
      children: [
        Image.asset(trendingAnime.ImageURL),
        SingleChildScrollView(
          child: Container(
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
                  decoration: BoxDecoration(
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
        ),
      ],
    );
  }
}



//HomeListWidget(listTitle: widget.homePlaylist[0].listTitle, animeList: widget.homePlaylist[0].animes,),
//HomeListWidget(listTitle: widget.homePlaylist[1].listTitle, animeList: widget.homePlaylist[1].animes,),
//HomeListWidget(listTitle: widget.homePlaylist[2].listTitle, animeList: widget.homePlaylist[2].animes,),