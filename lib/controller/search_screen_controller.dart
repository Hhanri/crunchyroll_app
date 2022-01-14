import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreenController extends GetxController{
  static const int searchHistoryLength = 10;
  static late List<AnimeContent> searchHistory;

  void addSearchTerm(AnimeContent anime) {
    if (searchHistory.any((element) => element == anime)) {
      putSearchTermFirst(anime);
      HistoryControllerPreferences.saveHistory();
      return;
    }
    searchHistory.add(anime);
    if (searchHistory.length > searchHistoryLength) {
      searchHistory.removeRange(0,searchHistory.length - searchHistoryLength);
    }
    HistoryControllerPreferences.saveHistory();
  }

  static void deleteSearchedTerm(AnimeContent anime) {
    searchHistory.removeWhere((t) => t == anime);
  }

  void putSearchTermFirst(AnimeContent anime) {
    deleteSearchedTerm(anime);
    addSearchTerm(anime);
  }
}


class HistoryControllerPreferences {
  static late SharedPreferences preferences;
  static Future init() async {
    preferences = await SharedPreferences.getInstance();
    HistoryControllerPreferences.loadHistory();
  }

  static void saveHistory() async {
    List<AnimeContent> historyList = SearchScreenController.searchHistory;
    List<String> savedList = AnimeContent.encodeAnimeContentToList(historyList);
    await preferences.setStringList(Strings.historyListKey, savedList);
  }

  static void loadHistory() async {
    List<String> jsonHistoryList = preferences.getStringList(Strings.historyListKey) ?? [];
    List<AnimeContent> loadedList = AnimeContent.decodeAnimeContentToList(jsonHistoryList);
    SearchScreenController.searchHistory= loadedList;
  }
}