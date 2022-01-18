import 'package:cached_network_image/cached_network_image.dart';
import 'package:crunchyroll_app/providers/firestore_provider.dart';
import 'package:crunchyroll_app/resources/strings.dart';
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
        if (snapshot.hasData) {
          return CachedNetworkImage(imageUrl: snapshot.data!);
        }
        if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
          return cardType == CardType.episodeCard
            ? Image.asset(ImagePath.episodePlaceholderThumbnail)
            : Image.asset(ImagePath.animePlaceholderThumbnail);
        }
        return cardType == CardType.episodeCard
            ? Image.asset(ImagePath.episodePlaceholderThumbnail)
            : Image.asset(ImagePath.animePlaceholderThumbnail);
      },
    );
  }
}