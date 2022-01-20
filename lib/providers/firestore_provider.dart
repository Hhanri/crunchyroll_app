import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseProvider {

  static Stream<List<AnimeContent>> get getAnimesStream => FirebaseFirestore
      .instance
      .collection(Strings.animesDatabaseCollection)
      .doc(Strings.animesDocument)
      .collection(Strings.animesCollection)
      .snapshots()
      .map((item) => AnimeContent.decodeAnimeContentToListFromFirebase(item.docs));

  static List<AnimeContent> animeListProvider(BuildContext context) => Provider.of<List<AnimeContent>>(context);

  static Stream<DocumentSnapshot<dynamic>> getAnimeEpisodesListStream(AnimeContent anime) => FirebaseFirestore
      .instance
      .collection(Strings.animesDatabaseCollection)
      .doc(Strings.episodesDocument)
      .collection(Strings.episodesCollection)
      .doc(anime.title + " - episodes")
      .snapshots();

  static Stream<AnimeContent>? getTrendingAnimeStream(List<AnimeContent> animes) => FirebaseFirestore
      .instance
      .collection(Strings.animesDatabaseCollection)
      .doc(Strings.trendingAnime)
      .snapshots()
      .map((element) => AnimeContent.decodeTrendingAnime(element.data(), animes));

  static AnimeContent trendingAnimeProvider(BuildContext context) => Provider.of<AnimeContent>(context);
  
  static Stream<List<HomeList>> getHomeListsStream(List<AnimeContent> animes) => FirebaseFirestore
      .instance
      .collection(Strings.animesDatabaseCollection)
      .doc("HomeListsDocument")
      .collection("HomeListsCollection")
      .orderBy("title", descending: true)
      .snapshots()
      .map((item) => HomeList.decodeHomeListsFromFirebase(item.docs, animes));

  static List<HomeList> homeListsProvider(BuildContext context) => Provider.of<List<HomeList>>(context);
}

class FirebaseStorageProvider {
  final firebaseStorage = FirebaseStorage.instance;
  Future<String> downloadURL(String imagePath) async {
    String downloadURL = await firebaseStorage.ref(imagePath).getDownloadURL();
    return downloadURL;
  }
}

class DataProvider{
  static late List<AnimeContent> animes;

  //static late AnimeContent trendingAnime = defaultAnimeModel;

  //static late List<HomeList> homePlaylists;

  //static late AnimeEpisodesList episodesList;
}
