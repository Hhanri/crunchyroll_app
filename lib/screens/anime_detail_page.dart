import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/providers/firestore_provider.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/select_season_page.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/utils/format_utils.dart';
import 'package:crunchyroll_app/utils/navigation_utils.dart';
import 'package:crunchyroll_app/widgets/anime_detail_header_widget.dart';
import 'package:crunchyroll_app/widgets/get_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeDetailScreen extends StatefulWidget {

  final AnimeContent featuredAnimeArgument;

  const AnimeDetailScreen({Key? key,
    required this.featuredAnimeArgument
  }) : super(key: key);

  @override
  _AnimeDetailScreenState createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {

  @override
  Widget build(BuildContext homeContext) {
    final AnimeContent _featuredAnime = widget.featuredAnimeArgument;

    return StreamBuilder<DocumentSnapshot<dynamic>> (
      stream: FirebaseProvider.getAnimeEpisodesListStream(_featuredAnime),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          NavigationUtils.showMyDialog(context: context, bodyText: Strings.errorFirebaseInit);
        }
        else if (snapshot.hasData) {
          final DocumentSnapshot<dynamic> _docs = snapshot.data;
          DataProvider.episodesList =
              AnimeEpisodesList.decodeAnimeEpisodesListFromFirebase(_docs);
          print(DataProvider.episodesList);
          List<AnimeSeason> _availableSeasons = [];
          DataProvider.episodesList.seasons.keys.forEach((key) {
            _availableSeasons.add(key);
          });
          AnimeSeason _selectedSeason = _availableSeasons[0];
          return Scaffold(
            body: Stack(
              children: [
                GetImageWidget(
                  imagePath: _featuredAnime.imageURL,
                  cardType: CardType.animeCard,
                ),
                SingleChildScrollView(
                  child: Column(
                      children: [
                        AnimeDetailHeader(
                            featuredAnime: _featuredAnime
                        ),
                        Container(
                          constraints: BoxConstraints(
                              minHeight: AppConfig.heightScreen(context),
                              minWidth: AppConfig.widthScreen(context)
                          ),
                          decoration: const BoxDecoration(
                              color: MyColors.backgroundColor
                          ),
                          child: Column(
                            children: [
                              _EpisodesGridWidget(
                                selectedSeason: _selectedSeason,
                                availableSeasons: _availableSeasons,
                                featuredAnime: _featuredAnime,
                              )
                            ],
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


class _EpisodesGridWidget extends StatefulWidget {
  final AnimeContent featuredAnime;
  final List<AnimeSeason> availableSeasons;
  AnimeSeason selectedSeason;
  _EpisodesGridWidget({
    Key? key,
    required this.selectedSeason,
    required this.availableSeasons,
    required this.featuredAnime,
  }) : super(key: key);

  @override
  State<_EpisodesGridWidget> createState() => _EpisodesGridWidgetState();
}

class _EpisodesGridWidgetState extends State<_EpisodesGridWidget> {
  @override
  Widget build(BuildContext context) {
    List<AnimeEpisode> _animeEpisodes = DataProvider.episodesList.seasons[widget.selectedSeason]!;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: const BoxDecoration(
            color: MyColors.containerColor2
          ),
          child: Text(
            Strings.episodeTitle,
            style: Theme.of(context).textTheme.headline1,
            maxLines: 1,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.to( () =>
              SelectSeasonScreen(
                availableSeasons: widget.availableSeasons,
                onSelectSeason: (newSelectedSeason) {
                  setState(() {
                    widget.selectedSeason = newSelectedSeason;
                  });
                },
                selectedSeason: widget.selectedSeason
              )
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              widget.selectedSeason.displaySeasonTitle(),
              style: Theme.of(context).textTheme.headline2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ),
        ...List.generate(_animeEpisodes.length, (index) {
          return _EpisodeCardWidget(
            animeEpisode: _animeEpisodes[index],
            hasSeen: (index == 0) ? true : false,

            /*
            hasSeen: (history.contains(AnimeEpisode)) ? true : false;
             */
          );
        })
      ],
    );
  }
}

class _EpisodeCardWidget extends StatelessWidget {

  final bool hasSeen;
  final AnimeEpisode animeEpisode;

  const _EpisodeCardWidget({
    Key? key,
    required this.animeEpisode,
    required this.hasSeen
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        hasSeen ? Colors.black.withOpacity(0.7) : Colors.transparent,
        BlendMode.color
      ),
      child: Container(
        color: MyColors.containerColor,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: FittedBox(
                child: GetImageWidget(
                  imagePath: animeEpisode.thumbnail,
                  cardType: CardType.episodeCard
                ),
              )
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  animeEpisode.displayEpisodeTitle(),
                  style: Theme.of(context).textTheme.headline3,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
