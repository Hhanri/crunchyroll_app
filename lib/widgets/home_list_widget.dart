import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/anime_detail_page.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/utils/route_generator.dart';
import 'package:flutter/material.dart';

class HomeListWidget extends StatelessWidget {

  final String listTitle;

  const HomeListWidget({Key? key,
    required this.listTitle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                listTitle,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 0
            ),
            scrollDirection: Axis.horizontal,
            itemCount: animes.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = animes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ANIME_DETAIL_PAGE,
                    arguments: content
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        content.ImageURL,
                        width: 139,
                        height: 208,
                      ),
                      Container(
                        width: 139,
                        height: 50,
                        color: MyColors.containerColor,
                        child: Center(
                          child: Text(
                            content.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
