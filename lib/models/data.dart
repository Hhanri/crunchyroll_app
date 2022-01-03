import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';

import 'content_model.dart';

final List<Content> animes = [
  const Content(
    title: Strings.KimetsuNoYaibaTitle,
    imageURL: ImagePath.KimetsuNoYaibaThumbnail,
    description: "Découvrez une aventure où le sang va couler sous la lame de l’épée. Nous sommes pendant l’ère Taishô. Tanjirô, un jeune et sympathique vendeur de charbon voit son quotidien changer radicalement après le massacre de sa famille par un démon. Seule sa petite sœur Nezuko survit à l’attaque, mais elle est transformée en un démon féroce. Ils partent tous deux en voyage afin de prendre leur revanche et de rendre à Nezuko son apparence d’origine. Vivez avec eux ce périple dans lequel le destin des humains et des démons s’entremêlent. ",
    publisher: "Aniplexe of America"),
  const Content(
    title: Strings.NarutoTitle,
    imageURL: ImagePath.NarutoThumbnail,
    description: "description",
    publisher: "TV Tokyo"
  ),
  const Content(
    title: Strings.QuintessentialQuintupletsTitle,
    imageURL: ImagePath.QuintessentialQuintupletsThumbnail,
    description: "Fûtarô Uesugi est un lycéen issu d'une famille modeste. Un jour, il reçoit une alléchante proposition pour un poste fort bien rémunéré en tant que professeur particulier à temps partiel. Mais voilà, les filles dont il doit s'occuper sont dans sa propre classe ! De plus, ce sont des quintuplées ! Toutes les cinq sont très séduisantes, mais ce sont des élèves à problèmes car elles détestent étudier et leurs notes s'en ressentent. La première mission de Fûtarô sera donc de gagner la confiance des sœurs Nakano... ",
    publisher: "TBS"
  ),
  const Content(
    title: Strings.KarakaiJouzuNoTakagisanTitle,
    imageURL: ImagePath.KarakaiJouzuNoTakagiSanThumbnail,
    description: "Takagi aime bien son voisin de classe, le timide Nishikata. Jour après jour, elle n’arrête pas de se moquer de lui. Mais Nishikata a décidé de réagir : il se met lui aussi à taquiner sa camarade, même si ses blagues se retournent souvent contre lui. Au fil du temps, une complicité va naître de leurs gentilles petites querelles.",
    publisher: "Sumitomo Corporation"
  ),

];

final Content trendingAnime = animes[animes.indexWhere((element) => element.title == 'Kimetsu no Yaiba')];


final List<HomeList> homePlaylists = [
  HomeList(
    listTitle: "Trending",
    animes: [
      animes[animes.indexWhere((element) => element.title == Strings.KimetsuNoYaibaTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.NarutoTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.QuintessentialQuintupletsTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.KarakaiJouzuNoTakagisanTitle)],
    ]
  ),
  HomeList(
    listTitle: "Recently Added",
    animes: [
      animes[animes.indexWhere((element) => element.title == Strings.NarutoTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.QuintessentialQuintupletsTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.KimetsuNoYaibaTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.KarakaiJouzuNoTakagisanTitle)],
    ]
  ),
  HomeList(
    listTitle: "Most seen",
    animes: [
      animes[animes.indexWhere((element) => element.title == Strings.KarakaiJouzuNoTakagisanTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.KimetsuNoYaibaTitle)],
     /* animes[animes.indexWhere((element) => element.title == Strings.QuintessentialQuintupletsTitle)],
      animes[animes.indexWhere((element) => element.title == Strings.NarutoTitle)], */
    ]
  ),
];

final Map<Content,AnimeEpisodesList> animesEpisodesList = {

  animes[animes.indexWhere((element) => element.title == Strings.KarakaiJouzuNoTakagisanTitle)] :
    AnimeEpisodesList(
      seasons: {
        AnimeSeason(
          seasonTitle: Strings.KarakaiJouzuNoTakagisanTitle,
          season: "S1"
        ) : [
          AnimeEpisode(
            episodeTitle: "La Gomme / Les Corvées du matin / Les Grimaces / La Pièce",
            season: "S1",
            episode: "E1"),
          AnimeEpisode(
            episodeTitle: "Calligraphie / Traduction / La Piscine",
            season: "S1",
            episode: "E2"
          ),
        ],
      }
    ),

  animes[animes.indexWhere((element) => element.title == Strings.KimetsuNoYaibaTitle)] :
    AnimeEpisodesList(
      seasons: {
        AnimeSeason(
          seasonTitle: Strings.KimetsuNoYaibaTitle,
          season: "S1"
        ) : [
          AnimeEpisode(
            episodeTitle: "Cruauté",
            season: "S1",
            episode: "E1"
          ),
          AnimeEpisode(
            episodeTitle: "Sakonji Urokodaki le formateur",
            season: "S1",
            episode: "E2"
          ),
        ],
        AnimeSeason(
          seasonTitle: Strings.KimetsuNoYaibaS2Title,
          season: "S2"
        ) : [
          AnimeEpisode(
            episodeTitle: "Uzui Tengen, le pilier du son",
            season: "S2",
            episode: "E1"
          ),
        ],
      }
  ),

  animes[animes.indexWhere((element) => element.title == Strings.NarutoTitle)] :
    AnimeEpisodesList(
      seasons: {
        AnimeSeason(
          seasonTitle: Strings.NarutoTitle,
          season: "S1"
        ) : [
          AnimeEpisode(
            episodeTitle: "Et voici Naruto Uzumaki",
            season: "S1",
            episode: "E1"
          ),
          AnimeEpisode(
            episodeTitle: "Je m'appelle Konohamaru",
            season: "S1",
            episode: "E2"
          ),
        ],
      }
  ),

  animes[animes.indexWhere((element) => element.title == Strings.QuintessentialQuintupletsTitle)] :
    AnimeEpisodesList(
      seasons: {
        AnimeSeason(
          seasonTitle: Strings.QuintessentialQuintupletsTitle,
          season: "S1"
        ) : [
          AnimeEpisode(
            episodeTitle: "Cinq nuances de fiancée",
            season: "S1",
            episode: "E1"
          ),
          AnimeEpisode(
            episodeTitle: "Déclaration sur le toit",
            season: "S1",
            episode: "E2"
          ),
        ],
        AnimeSeason(
          seasonTitle: Strings.QuintessentialQuintupletsS2Title,
          season: "S2"
        ) : [
          AnimeEpisode(
            episodeTitle: "Un jour à Kyoto",
            season: "S2",
            episode: "E1"
          ),
          AnimeEpisode(
            episodeTitle: "Sept au revoir - Chapitre 1",
            season: "S2",
            episode: "E2"
          ),
        ]
      }
    ),
};