import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/widgets/anime_card_widget.dart';
import 'package:crunchyroll_app/widgets/content_header_widget.dart';
import 'package:crunchyroll_app/widgets/home_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final Content featuredAnime;

  const HomeScreen({Key? key,
    required this.featuredAnime
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext homeContext) {
    return Stack(
      children: [
        Image.asset(widget.featuredAnime.ImageURL),
        SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: AppConfig.heightScreen(context)
            ),
            child: Column(
              children: [
                ContentHeaderWidget(
                  featuredAnime: widget.featuredAnime,
                ),
                Container(
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
                        HomeListWidget(listTitle: "List 1"),
                        HomeListWidget(listTitle: "List 1"),
                        HomeListWidget(listTitle: "List 1"),
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
