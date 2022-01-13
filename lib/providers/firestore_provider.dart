import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseProvider {

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

class FirebaseStorageProvider {
  final firebaseStorage = FirebaseStorage.instance;

  Future<String> downloadURL(String imagePath) async {
    String downloadURL = await firebaseStorage.ref(imagePath).getDownloadURL();
    return downloadURL;
  }
}

class DataProvider{
  static late List<AnimeContent> animes;

  static late AnimeContent trendingAnime;

  static late List<HomeList> homePlaylists;
}
