import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/providers/firestore_provider.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/anime_detail_page.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/utils/navigation_utils.dart';
import 'package:crunchyroll_app/widgets/anime_card_widget.dart';
import 'package:crunchyroll_app/widgets/content_header_widget.dart';
import 'package:crunchyroll_app/widgets/get_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {


  final List<AnimeContent> animes;
  const HomeScreen({Key? key,

    required this.animes,
  }) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AnimeContent>(
      stream: FirebaseProvider.getTrendingAnimeStream(animes),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          NavigationUtils.showMyDialog(context: context,
              bodyText: Strings.errorFirebaseInit
          );
        }
        if (snapshot.hasData) {
          AnimeContent _trendingAnime = snapshot.data!;
          return Scaffold(
            body: Stack(
              children: [
                GetImageWidget(
                  imagePath: _trendingAnime.imageURL,
                  cardType: CardType.animeCard
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ContentHeaderWidget(
                        featuredAnime: _trendingAnime,
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
                          child: FullHomeListsWidget(animes: animes)
                        ),
                      )
                    ]
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      }
    );
  }
}

class FullHomeListsWidget extends StatelessWidget {
  final List<AnimeContent> animes;
  const FullHomeListsWidget({
    Key? key,
    required this.animes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<HomeList>>(
      stream: FirebaseProvider.getHomeListsStream(animes),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          NavigationUtils.showMyDialog(context: context,
            bodyText: Strings.errorFirebaseInit
          );
        }
        if (snapshot.hasData) {
          List<HomeList> _homePlaylists = snapshot.data!;
          return Column(
            children: <HomeListWidget>[
              ...List.generate(_homePlaylists.length, (index) {
                return HomeListWidget(
                    listTitle: _homePlaylists[index].listTitle,
                    animeList: _homePlaylists[index].animes
                );
              })
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      }
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
            child: GridView.builder(
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
                    Get.to(() => AnimeDetailScreen(featuredAnimeArgument: animeContent),
                    );
                  },
                  child: AnimeCardWidget(
                    featuredAnime: animeContent,
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio:(380-15)/(((380+16)/960)*640*(10/13)),
                mainAxisSpacing: 0,
                crossAxisCount: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}



