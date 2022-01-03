import 'package:crunchyroll_app/models/content_model.dart';
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
    return Stack(
      children: [
        Image.asset(widget.featuredAnimeArgument.ImageURL),
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                AnimeDetailHeader(
                  featuredAnime: widget.featuredAnimeArgument
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
                      children: [

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


