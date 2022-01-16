import 'package:cached_network_image/cached_network_image.dart';
import 'package:crunchyroll_app/providers/firestore_provider.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';


class GetImageWidget extends StatelessWidget {
  final String cardType;
  final String imagePath;
  const GetImageWidget({
    Key? key,
    required this.imagePath,
    required this.cardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseStorageProvider().downloadURL(imagePath),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done || snapshot.hasData) {
          return CachedNetworkImage(imageUrl: snapshot.data!);
        }
        if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
          return cardType == CardType.episodeCard
              ? Container(color: MyColors.containerColor, height: 640, width: 960)
              : cardType == CardType.animeCard
              ? Container(color: MyColors.containerColor, height: 960, width: 640)
              : Container(color: Colors.white, height: (960*2/7)-20, width: (640*2/7)-60);
        }
        return cardType == CardType.episodeCard
            ? Container(color: MyColors.containerColor, height: 640, width: 960)
            : cardType == CardType.animeCard
            ? Container(color: MyColors.containerColor, height: 960, width: 640)
            : Container(color: MyColors.containerColor, height: 960*2/7, width: 640*2/7);
      },
    );
  }
}