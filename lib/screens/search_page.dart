import 'package:crunchyroll_app/controller/search_screen_controller.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/anime_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AnimeSearch extends SearchDelegate<AnimeContent?> {

  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        }else{
          query = "";
        }
      },
    )
  ];

  @override
  Widget buildLeading(BuildContext context) =>
    IconButton(
      icon: Icon(Icons.arrow_back_outlined),
      onPressed: () {
        close(context, null);
      },
    );

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty){
      List<AnimeContent> suggestions = SearchScreenController.searchHistory.reversed.toList();
      return buildSuggestionsFailed(suggestions);
    } else {
      List<AnimeContent> suggestions = animes.where((element) => element.title.toUpperCase().contains(query.toUpperCase())).toList();
      return buildSuggestionsSuccess(suggestions);
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty){
      List<AnimeContent> suggestions = SearchScreenController.searchHistory.reversed.toList();
      return buildSuggestionsFailed(suggestions);
    } else {
      List<AnimeContent> suggestions = animes.where((element) => element.title.toUpperCase().contains(query.toUpperCase())).toList();
      return buildSuggestionsSuccess(suggestions);
    }
  }

  Widget buildSuggestionsSuccess(List<AnimeContent> suggestions) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
          return AnimeTileWidget(anime: suggestion);
      }
    );
  }
  Widget buildSuggestionsFailed(List<AnimeContent> suggestions) {
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return AnimeHistoryTileWidget(anime: suggestion, update: () { query = ""; },);
        }
    );
  }

}

class AnimeTileWidget extends StatelessWidget {
  final AnimeContent anime;
  const AnimeTileWidget({
    Key? key, 
    required this.anime
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextButton(
        onPressed: () {
          SearchScreenController().addSearchTerm(anime);
          Get.to(()=> AnimeDetailScreen(featuredAnimeArgument: anime));
        },
        child: Container(
          color: MyColors.containerColor,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    anime.imageURL,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          anime.title,
                          style: Theme.of(context).textTheme.headline1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Spacer(
                            flex: 4,
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                              },
                              icon: const Icon(Icons.more_vert)),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}

class AnimeHistoryTileWidget extends StatelessWidget {
  final AnimeContent anime;
  final VoidCallback update;
  const AnimeHistoryTileWidget({
    Key? key,
    required this.anime,
    required this.update
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        color: MyColors.containerColor,
        child: ListTile(
          iconColor: Colors.grey.shade400,
          onTap: (){
            SearchScreenController().addSearchTerm(anime);
            Get.to(()=> AnimeDetailScreen(featuredAnimeArgument: anime));
          },
          title: Text(
            anime.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline3,
          ),
          trailing: IconButton(
            icon: Icon(Icons.clear),
            onPressed: (){
              SearchScreenController.deleteSearchedTerm(anime);
              update();
            },
          ),
        ),
      ),
    );
  }
}
