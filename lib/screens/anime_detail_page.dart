import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/utils/format_utils.dart';
import 'package:crunchyroll_app/utils/route_generator.dart';
import 'package:crunchyroll_app/widgets/anime_detail_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeDetailScreen extends StatefulWidget {

  final dynamic featuredAnimeArgument;

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
    List<AnimeSeason> _availableSeasons = [];
    animesEpisodesList[_featuredAnime]!.seasons.keys.forEach((key) {
      _availableSeasons.add(key);
    });
    AnimeSeason _selectedSeason = _availableSeasons[0];

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(_featuredAnime.getAnimeThumbail()),
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
    List<AnimeEpisode> _animeEpisodes = animesEpisodesList[widget.featuredAnime]!.seasons[widget.selectedSeason]!;

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
            style: Theme.of(context).textTheme.headline1
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pushNamed(
            SELECT_SEASON_PAGE,
            arguments: {
              "availableSeasons" : widget.availableSeasons,
              "function" : (newSelectedSeason) {
                setState(() {
                 widget.selectedSeason = newSelectedSeason;
                });
              },
              "selectedSeason" : widget.selectedSeason
              },
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  widget.selectedSeason.displaySeasonTitle(),
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          )
        ),
        ...List.generate(_animeEpisodes.length, (index) {
          return _EpisodeCardWidget(animeEpisode: _animeEpisodes[index]);
        })
      ],
    );
  }
}

class _EpisodeCardWidget extends StatelessWidget {

  final AnimeEpisode animeEpisode;

  const _EpisodeCardWidget({
    Key? key,
    required this.animeEpisode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(animeEpisode.getEpisodeThumbnail())
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                animeEpisode.displayEpisodeTitle(),
                style: Theme.of(context).textTheme.headline3
              ),
            ),
          ),
        ],
      ),
    );
  }
}
