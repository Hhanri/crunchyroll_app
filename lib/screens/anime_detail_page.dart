import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/utils/route_generator.dart';
import 'package:crunchyroll_app/widgets/anime_detail_header_widget.dart';
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

    final Content _featuredAnime = widget.featuredAnimeArgument;
    List<AnimeSeason> _availableSeasons = [];
    animesEpisodesList[_featuredAnime]!.seasons.keys.forEach((key) {
      _availableSeasons.add(key);
    });
    AnimeSeason _selectedSeason = _availableSeasons[0];

    return Stack(
      children: [
        Image.asset(widget.featuredAnimeArgument.imageURL),
        SingleChildScrollView(
          child: Container(
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
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            SELECT_SEASON_PAGE,
                            arguments: _availableSeasons
                          );
                        },
                      )
                    ],
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


class _EpisodesGridWidget extends StatelessWidget {
  final VoidCallback onTap;
  final AnimeSeason selectedSeason;
  const _EpisodesGridWidget({
    Key? key,
    required this.selectedSeason,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.containerColor2
          ),
          child: Text(
            Strings.episodeTitle,
            style: Theme.of(context).textTheme.headline1
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  selectedSeason.season + " - " + selectedSeason.seasonTitle,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}

