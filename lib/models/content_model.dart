import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:equatable/equatable.dart';

class AnimeContent extends Equatable {
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

  factory AnimeContent.fromJson(Map<String, dynamic> jsonData) {
    return AnimeContent(
      title: jsonData[Strings.titleFormat],
      imageURL: jsonData[Strings.imageURLFormat],
      description: jsonData[Strings.descriptionFormat],
      publisher: jsonData[Strings.publisherFormat],
      tags: jsonData[Strings.tagsFormat].cast<String>()
    );
  }
  static Map<String, dynamic> toMap(AnimeContent animeContent) => {
    Strings.titleFormat: animeContent.title,
    Strings.imageURLFormat: animeContent.imageURL,
    Strings.descriptionFormat: animeContent.description,
    Strings.publisherFormat: animeContent.publisher,
    Strings.tagsFormat: animeContent.tags
  };

  static String encodeAnimeContent(List<AnimeContent> animes) {
    return json.encode(
      animes.map(
        (anime) => AnimeContent.toMap(anime)
      )
    );
  }

  static List<String> encodeAnimeContentToList(List<AnimeContent> animes) {
    return animes.map(
      (anime) => json.encode(AnimeContent.toMap(anime))
    ).toList();
  }
  static List<AnimeContent> decodeAnimeContentToList(List<String>? jsonData) {
    return jsonData!.map(
      (anime) => AnimeContent.fromJson(json.decode(anime))
    ).toList();
  }
  static List<AnimeContent> decodeAnimeContentToListFromFirebase(List<QueryDocumentSnapshot<dynamic>> queryData) {
    return queryData.map(
      (anime) => AnimeContent.fromJson(anime.data())
    ).toList();
  }
  static AnimeContent decodeAnimeContentFromFirebase(QueryDocumentSnapshot<dynamic> queryData) {
    return AnimeContent.fromJson(queryData.data());
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, imageURL, description, publisher, tags];
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