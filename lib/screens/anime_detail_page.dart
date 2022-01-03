import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/widgets/anime_detail_header_widget.dart';
import 'package:crunchyroll_app/widgets/home_list_widget.dart';
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

    final _featuredAnime = widget.featuredAnimeArgument;

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
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColor
                  ),
                  child: Column(
                    children: [
                      _EpisodesGridWidget()
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
  const _EpisodesGridWidget({Key? key}) : super(key: key);

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
      ],
    );
  }
}
