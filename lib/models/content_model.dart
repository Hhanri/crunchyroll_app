class AnimeContent {
  final String title;
  final String imageURL;
  final String description;
  final String publisher;
  final List<String> tags;
  const AnimeContent({
    required this.title,
    required this.imageURL,
    required this.description,
    required this.publisher,
    required this.tags
  });
}

class HomeList {
  final String listTitle;
  final List<AnimeContent> animes;
  HomeList({
    required this.listTitle,
    required this.animes
  });
}

class AnimeEpisode {
  final String animeTitle;
  final String season;
  final String episode;
  final String episodeTitle;
  final String thumbnail;
  AnimeEpisode({
    required this.animeTitle,
    required this.season,
    required this.episode,
    required this.episodeTitle,
    required this.thumbnail
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