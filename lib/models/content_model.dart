class Content {

  final String title;
  final String ImageURL;
  final String description;

  const Content({
    required this.title,
    required this.ImageURL,
    required this.description
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