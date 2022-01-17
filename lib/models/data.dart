import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';

import 'content_model.dart';

const AnimeContent defaultAnimeModel = AnimeContent(
    title: "anime",
    imageURL: ImagePath.animePlaceholderThumbnail,
    description: "description",
    publisher: "publisher",
    tags: []
);

final List<Map<String,String>> tagsList = [
  {Tags.tagTitle: Tags.action, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.adventure, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.comedy, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.drama, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.fantastic, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.harem, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.historic, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.idols, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.isekai, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.magicalGirls, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.music, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.mystery, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.postApocalyptic, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.romantic, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.sciFi, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.seinen, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.schoolLife, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.shoujo, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.shonen, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.sliceOfLife, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.sport, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.supernatural, Tags.tagThumbnail: ImagePath.whiteThumbnail},
  {Tags.tagTitle: Tags.thriller, Tags.tagThumbnail: ImagePath.whiteThumbnail},
];