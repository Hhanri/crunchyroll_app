import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FirestoreProvider {

  static Stream<List<AnimeContent>> get getAnimesStream => FirebaseFirestore
      .instance
      .collection("animes")
      //.collection(Strings.animesDatabaseCollection)
      //.doc(Strings.animesDocument)
      //.collection(Strings.animesDocument)
      .snapshots()
      .map((item) => AnimeContent.decodeAnimeContentToListFromFirebase(item.docs));

  static List<AnimeContent> animeListProvider(BuildContext context) => Provider.of<List<AnimeContent>>(context);

}

class DataProvider extends GetxController{
  static late List<AnimeContent> animes;

  static late AnimeContent trendingAnime;

  static late List<HomeList> homePlaylists;
}