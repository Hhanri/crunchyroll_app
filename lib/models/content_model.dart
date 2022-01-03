import 'package:crunchyroll_app/resources/strings.dart';

class Content {
  final String title;
  final String imageURL;
  final String description;
  final String publisher;
  const Content({
    required this.title,
    required this.imageURL,
    required this.description,
    required this.publisher
  });
}

class HomeList {
  final String listTitle;
  final List<Content> animes;
  HomeList({
    required this.listTitle,
    required this.animes
  });
}

class AnimeEpisode {
  final String season;
  final String episode;
  final String episodeTitle;
  final String thumbnail = ImagePath.whiteThumbnail;
  AnimeEpisode({
    required this.season,
    required this.episode,
    required this.episodeTitle
  });
}

class AnimeEpisodesList {
  final Map<AnimeSeason,List<AnimeEpisode>> seasons;
  AnimeEpisodesList({
    required this.seasons
  });
}

class AnimeSeason {
  final String season;
  final String seasonTitle;

  AnimeSeason({
    required this.season,
    required this.seasonTitle
  });


}