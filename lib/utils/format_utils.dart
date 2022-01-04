import 'package:crunchyroll_app/models/content_model.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this);
  }
}

extension SeasonTitleEpisodeGridViewDisplay on AnimeSeason {
  String displaySeasonTitle() {
    return season + " - " + seasonTitle;
  }
}

extension AnimeEpisodeTitle on AnimeEpisode {
  String displayEpisodeTitle() {
    return "$season $episode - $episodeTitle";
  }
}

extension AnimeThumbnailGetter on AnimeContent {
  String getAnimeThumbail() {
    String formattedTitle = title.replaceAll(" ", "_");
    return "assets/images/anime_thumbnails/$formattedTitle/$formattedTitle.jpg";
  }
}

extension EpisodeThumbnailGetter on AnimeEpisode {
  String getEpisodeThumbnail() {
    String formattedTitle = animeTitle.replaceAll(" ", "_");
    return "assets/images/anime_thumbnails/$formattedTitle/$formattedTitle - $season/$formattedTitle - $season $episode - thumbnail.jpg";
  }
}