import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';

import 'content_model.dart';

final List<AnimeContent> animes = [
  const AnimeContent(
    title: Strings.kimetsuNoYaibaTitle,
    imageURL: ImagePath.kimetsuNoYaibaThumbnail,
    description: "Découvrez une aventure où le sang va couler sous la lame de l’épée. Nous sommes pendant l’ère Taishô. Tanjirô, un jeune et sympathique vendeur de charbon voit son quotidien changer radicalement après le massacre de sa famille par un démon. Seule sa petite sœur Nezuko survit à l’attaque, mais elle est transformée en un démon féroce. Ils partent tous deux en voyage afin de prendre leur revanche et de rendre à Nezuko son apparence d’origine. Vivez avec eux ce périple dans lequel le destin des humains et des démons s’entremêlent. ",
    publisher: "Aniplexe of America",
    tags: [
      Tags.action,
      Tags.adventure,
      Tags.drama,
      Tags.fantastic,
      Tags.historic,
      Tags.shonen,
      Tags.supernatural
    ]
  ),
  const AnimeContent(
    title: Strings.narutoTitle,
    imageURL: ImagePath.narutoThumbnail,
    description: "description",
    publisher: "TV Tokyo",
    tags: [
      Tags.action,
      Tags.adventure,
      Tags.comedy,
      Tags.drama,
      Tags.fantastic,
      Tags.shonen,
      Tags.supernatural
    ]
  ),
  const AnimeContent(
    title: Strings.quintessentialQuintupletsTitle,
    imageURL: ImagePath.quintessentialQuintupletsThumbnail,
    description: "Fûtarô Uesugi est un lycéen issu d'une famille modeste. Un jour, il reçoit une alléchante proposition pour un poste fort bien rémunéré en tant que professeur particulier à temps partiel. Mais voilà, les filles dont il doit s'occuper sont dans sa propre classe ! De plus, ce sont des quintuplées ! Toutes les cinq sont très séduisantes, mais ce sont des élèves à problèmes car elles détestent étudier et leurs notes s'en ressentent. La première mission de Fûtarô sera donc de gagner la confiance des sœurs Nakano... ",
    publisher: "TBS",
    tags: [
      Tags.comedy,
      Tags.romantic,
      Tags.schoolLife,
      Tags.shonen,
    ]
  ),
  const AnimeContent(
    title: Strings.karakaiJouzuNoTakagisanTitle,
    imageURL: ImagePath.karakaiJouzuNoTakagiSanThumbnail,
    description: "Takagi aime bien son voisin de classe, le timide Nishikata. Jour après jour, elle n’arrête pas de se moquer de lui. Mais Nishikata a décidé de réagir : il se met lui aussi à taquiner sa camarade, même si ses blagues se retournent souvent contre lui. Au fil du temps, une complicité va naître de leurs gentilles petites querelles.",
    publisher: "Sumitomo Corporation",
    tags: [
      Tags.comedy,
      Tags.romantic,
      Tags.schoolLife,
      Tags.sliceOfLife
    ]
  ),

];

final AnimeContent trendingAnime = animes[animes.indexWhere((element) => element.title == Strings.kimetsuNoYaibaTitle)];


final List<HomeList> homePlaylists = [
  HomeList(
    listTitle: "Trending",
    animes: [
      animes[animes.indexWhere((element) => element.title == Strings.kimetsuNoYaibaTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.narutoTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.quintessentialQuintupletsTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.karakaiJouzuNoTakagisanTitle)],
    ]
  ),
  HomeList(
    listTitle: "Recently Added",
    animes: [
      animes[animes.indexWhere((element) => element.title == Strings.narutoTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.quintessentialQuintupletsTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.kimetsuNoYaibaTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.karakaiJouzuNoTakagisanTitle)],
    ]
  ),
  HomeList(
    listTitle: "Most seen",
    animes: [
      animes[animes.indexWhere((element) => element.title == Strings.karakaiJouzuNoTakagisanTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.kimetsuNoYaibaTitle)],
     /* animes[animes.indexWhere((element) => element.title == Strings.QuintessentialQuintupletsTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.NarutoTitle)], */
    ]
  ),
];

final Map<AnimeContent,AnimeEpisodesList> animesEpisodesList = {

  animes[animes.indexWhere((element) => element.title == Strings.karakaiJouzuNoTakagisanTitle)] :
    AnimeEpisodesList(
      seasons: {
        AnimeSeason(
          seasonTitle: Strings.karakaiJouzuNoTakagisanTitle,
          season: "S1"
        ) : [
          AnimeEpisode(
            animeTitle: Strings.karakaiJouzuNoTakagisanTitle,
            episodeTitle: "La Gomme / Les Corvées du matin / Les Grimaces / La Pièce",
            season: "S1",
            episode: "E1",
            thumbnail: "assets/images/anime_thumbnails/Karakai_Jouzu_No_Takagi-san/Karakai_Jouzu_No_Takagi-san - S1/Karakai_Jouzu_No_Takagi-san - S1 E1 - thumbnail.jpg"
          ),
          AnimeEpisode(
            animeTitle: Strings.karakaiJouzuNoTakagisanTitle,
            episodeTitle: "Calligraphie / Traduction / La Piscine",
            season: "S1",
            episode: "E2",
            thumbnail: "assets/images/anime_thumbnails/Karakai_Jouzu_No_Takagi-san/Karakai_Jouzu_No_Takagi-san - S1/Karakai_Jouzu_No_Takagi-san - S1 E2 - thumbnail.jpg"
          ),
        ],
      }
    ),

  animes[animes.indexWhere((element) => element.title == Strings.kimetsuNoYaibaTitle)] :
    AnimeEpisodesList(
      seasons: {
        AnimeSeason(
          seasonTitle: Strings.kimetsuNoYaibaTitle,
          season: "S1"
        ) : [
          AnimeEpisode(
            animeTitle: Strings.kimetsuNoYaibaTitle,
            episodeTitle: "Cruauté",
            season: "S1",
            episode: "E1",
            thumbnail: "assets/images/anime_thumbnails/Kimetsu_No_Yaiba/Kimetsu_No_Yaiba - S1/Kimetsu_No_Yaiba - S1 E1 - thumbnail.jpg"
          ),
          AnimeEpisode(
            animeTitle: Strings.kimetsuNoYaibaTitle,
            episodeTitle: "Sakonji Urokodaki le formateur",
            season: "S1",
            episode: "E2",
            thumbnail: "assets/images/anime_thumbnails/Kimetsu_No_Yaiba/Kimetsu_No_Yaiba - S1/Kimetsu_No_Yaiba - S1 E2 - thumbnail.jpg"
          ),
        ],
        AnimeSeason(
          seasonTitle: Strings.kimetsuNoYaibaS2Title,
          season: "S2"
        ) : [
          AnimeEpisode(
            animeTitle: Strings.kimetsuNoYaibaTitle,
            episodeTitle: "Uzui Tengen, le pilier du son",
            season: "S2",
            episode: "E1",
            thumbnail: "assets/images/anime_thumbnails/Kimetsu_No_Yaiba/Kimetsu_No_Yaiba - S2/Kimetsu_No_Yaiba - S2 E1 - thumbnail.jpg"
          ),
        ],
      }
  ),

  animes[animes.indexWhere((element) => element.title == Strings.narutoTitle)] :
    AnimeEpisodesList(
      seasons: {
        AnimeSeason(
          seasonTitle: Strings.narutoTitle,
          season: "S1"
        ) : [
          AnimeEpisode(
            animeTitle: Strings.narutoTitle,
            episodeTitle: "Et voici Naruto Uzumaki",
            season: "S1",
            episode: "E1",
            thumbnail: "assets/images/anime_thumbnails/Naruto/Naruto - S1/Naruto - S1 E1 - thumbnail.jpg"
          ),
          AnimeEpisode(
            animeTitle: Strings.narutoTitle,
            episodeTitle: "Je m'appelle Konohamaru",
            season: "S1",
            episode: "E2",
            thumbnail: "assets/images/anime_thumbnails/Naruto/Naruto - S1/Naruto - S1 E2 - thumbnail.jpg"
          ),
        ],
      }
  ),

  animes[animes.indexWhere((element) => element.title == Strings.quintessentialQuintupletsTitle)] :
    AnimeEpisodesList(
      seasons: {
        AnimeSeason(
          seasonTitle: Strings.quintessentialQuintupletsTitle,
          season: "S1"
        ) : [
          AnimeEpisode(
            animeTitle: Strings.quintessentialQuintupletsTitle,
            episodeTitle: "Cinq nuances de fiancée",
            season: "S1",
            episode: "E1",
              thumbnail:"assets/images/anime_thumbnails/Quintessential_Quintuplets/Quintessential_Quintuplets - S1/Quintessential_Quintuplets - S1 E1 - thumbnail.jpg"
          ),
          AnimeEpisode(
            animeTitle: Strings.quintessentialQuintupletsTitle,
            episodeTitle: "Déclaration sur le toit",
            season: "S1",
            episode: "E2",
              thumbnail:"assets/images/anime_thumbnails/Quintessential_Quintuplets/Quintessential_Quintuplets - S1/Quintessential_Quintuplets - S1 E2 - thumbnail.jpg"
          ),
        ],
        AnimeSeason(
          seasonTitle: Strings.quintessentialQuintupletsS2Title,
          season: "S2"
        ) : [
          AnimeEpisode(
            animeTitle: Strings.quintessentialQuintupletsTitle,
            episodeTitle: "Un jour à Kyoto",
            season: "S2",
            episode: "E1",
              thumbnail:"assets/images/anime_thumbnails/Quintessential_Quintuplets/Quintessential_Quintuplets - S2/Quintessential_Quintuplets - S2 E1 - thumbnail.jpg"
          ),
          AnimeEpisode(
            animeTitle: Strings.quintessentialQuintupletsTitle,
            episodeTitle: "Sept au revoir - Chapitre 1",
            season: "S2",
            episode: "E2",
            thumbnail:"assets/images/anime_thumbnails/Quintessential_Quintuplets/Quintessential_Quintuplets - S2/Quintessential_Quintuplets - S2 E2 - thumbnail.jpg"
          ),
        ]
      }
    ),
};

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