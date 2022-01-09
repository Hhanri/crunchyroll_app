import 'package:crunchyroll_app/models/content_model.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchScreenController extends GetxController{
  static const int searchHistoryLength = 10;
  static List<AnimeContent> searchHistory = [];

  List<AnimeContent> filteredSearchTerms({
    required String? filter
  }) {
    if (filter != null && filter.isNotEmpty) {
      return searchHistory.reversed
          .where((animeSearch) => animeSearch.title.startsWith(filter))
          .toList();
    } else {
      return searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(AnimeContent anime) {
    if (searchHistory.contains(anime)) {
      putSearchTermFirst(anime);
      return;
    }
    searchHistory.add(anime);
    if (searchHistory.length > searchHistoryLength) {
      searchHistory.removeRange(0,searchHistory.length - searchHistoryLength);
    }
  }

  static void deleteSearchedTerm(AnimeContent anime) {
    searchHistory.removeWhere((t) => t == anime);
  }

  void putSearchTermFirst(AnimeContent anime) {
    deleteSearchedTerm(anime);
    addSearchTerm(anime);
  }
}