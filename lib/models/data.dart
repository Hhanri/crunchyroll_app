import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';

final List<Content> animes = [
  Content(
    title: 'Kimetsu no Yaiba',
    ImageURL: ImagePath.KimetsuNoYaibaThumbnail,
    description: "Découvrez une aventure où le sang va couler sous la lame de l’épée. Nous sommes pendant l’ère Taishô. Tanjirô, un jeune et sympathique vendeur de charbon voit son quotidien changer radicalement après le massacre de sa famille par un démon. Seule sa petite sœur Nezuko survit à l’attaque, mais elle est transformée en un démon féroce. Ils partent tous deux en voyage afin de prendre leur revanche et de rendre à Nezuko son apparence d’origine. Vivez avec eux ce périple dans lequel le destin des humains et des démons s’entremêlent. "),
  Content(
    title: 'Naruto',
    ImageURL: ImagePath.NarutoThumbnail,
    description: "description"),
  Content(
    title: 'Quintessential Quintuplets',
    ImageURL: ImagePath.QuintessentialQuintupletsThumbnail,
    description: "Fûtarô Uesugi est un lycéen issu d'une famille modeste. Un jour, il reçoit une alléchante proposition pour un poste fort bien rémunéré en tant que professeur particulier à temps partiel. Mais voilà, les filles dont il doit s'occuper sont dans sa propre classe ! De plus, ce sont des quintuplées ! Toutes les cinq sont très séduisantes, mais ce sont des élèves à problèmes car elles détestent étudier et leurs notes s'en ressentent. La première mission de Fûtarô sera donc de gagner la confiance des sœurs Nakano... "),
  Content(
    title: 'Karakai Jouzu no Takagi-san',
    ImageURL: ImagePath.KarakaiJouzuNoTakagiSanThumbnail,
    description: 'Takagi aime bien son voisin de classe, le timide Nishikata. Jour après jour, elle n’arrête pas de se moquer de lui. Mais Nishikata a décidé de réagir : il se met lui aussi à taquiner sa camarade, même si ses blagues se retournent souvent contre lui. Au fil du temps, une complicité va naître de leurs gentilles petites querelles. '),

];

final Content trendingAnime = animes[animes.indexWhere((element) => element.title == 'Kimetsu no Yaiba')];