import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/widgets/anime_card_widget.dart';
import 'package:crunchyroll_app/widgets/content_header_widget.dart';
import 'package:crunchyroll_app/widgets/home_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final GlobalKey _singleChildScrollViewKey = GlobalKey();
  
  @override
  Widget build(BuildContext homeContext) {
    return Stack(
      children: [
        Image.asset(ImagePath.thumbnail),
        SingleChildScrollView(
          key: _singleChildScrollViewKey,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  MyColors.backgroundColor
                ],
                stops: [0,0.25]
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20
              ),
              child: Column(
                children: [
                  ContentHeaderWidget(),
                  HomeListWidget(listTitle: "List 1"),
                  HomeListWidget(listTitle: "List 1"),
                  HomeListWidget(listTitle: "List 1"),
                ]
              ),
            ),
          ),
        ),
      ],
    );
  }
}
