import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/strings.dart';

import 'package:crunchyroll_app/screens/anime_detail_page.dart';
import 'package:crunchyroll_app/widgets/anime_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowseGenresScreen extends StatefulWidget {
  const BrowseGenresScreen({Key? key}) : super(key: key);

  @override
  _BrowseGenresScreenState createState() => _BrowseGenresScreenState();
}
class _BrowseGenresScreenState extends State<BrowseGenresScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _GenresContainer(
              tag: tagsList[index][Tags.tagTitle]!,
              thumbnail: tagsList[index][Tags.tagThumbnail]!,
            );
          },
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 960/640,
            //mainAxisSpacing: 13,
            crossAxisSpacing: 13,
            crossAxisCount: 2,
          ),
          itemCount: tagsList.length,
        ),
      ),
    );
  }
}

class _GenresContainer extends StatelessWidget {
  final String tag;
  final String thumbnail;
  const _GenresContainer({
    Key? key,
    required this.tag,
    required this.thumbnail
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(BrowseAnimesScreen(searchedItem: tag));
        //Navigator.of(context).pushNamed(BROWSE_ANIMES_PAGE, arguments: tag);
      },
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(thumbnail),
                  fit: BoxFit.contain
                )
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    stops: const [0, 0.9],
                    radius: 1,
                    colors: [
                      Colors.grey.shade400.withOpacity(0.6),
                      Colors.black.withOpacity(0.8)
                    ]
                  ),
                ),
              ),
            )
          ),
          Center(
            child: Text(
              tag,
              style: Theme.of(context).textTheme.bodyText1
            ),
          )
        ],
      )
    );
  }
}


class BrowseAnimesScreen extends StatelessWidget {

  final dynamic searchedItem;
  const BrowseAnimesScreen({
    Key? key,
    required this.searchedItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String _searchedItem = searchedItem;
    List<AnimeContent> _listToDisplay = [];
    animes.forEach((element) {
      if (element.tags.contains(_searchedItem)) {
        _listToDisplay.add(element);
      }
    });
    if (_listToDisplay == []) {
      animes.forEach((element) {
        if(element.title.contains(_searchedItem.toUpperCase())) {
          _listToDisplay.add(element);
        }
      });
    }

    return _listToDisplay.isEmpty
        ? const Scaffold(
            body: Center(
              child: Text(
                Strings.noResultFound
              ),
            ),
          )
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () {
                      Get.to(AnimeDetailScreen(featuredAnimeArgument: _listToDisplay[index]));
                    },
                    child: AnimeCardWidget(
                      featuredAnime: _listToDisplay[index],
                      listViewHeight: 380
                    )
                  );
                },
                itemCount: _listToDisplay.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (((380+16)/960)*640*(10/13))/(380-16),
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
              )
            ),
          );
  }
}
