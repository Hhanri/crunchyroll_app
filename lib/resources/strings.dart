class Strings {

  static const String appTitle = "Crunchyroll App";

  //textfield
  static const String username = "Username";
  static const String email = "Email";
  static const String password = "Password";
  static const String search = "Search...";
  static const String acceptTOS = "Accept Terms of Service";

  //textfield errors
  static const String errorEmptyField = "field is empty";
  static const String errorPasswordLength = "password is too short";
  static const String errorIsNotEmail = "not a valid email";
  static const String errorTOSCheck = "TOS not checked";
  static const String errorPasswordNotMatching = "Passwords do not match";

  //titles
  static const String signInTitle = "SIGN IN";
  static const String signUpTitle = "SIGN UP";
  static const String knowMoreTitle = "En Savoir Plus";
  static const String playTitle = "PLAY";

  //navigation utils
  static const String ok = "ok";

  //account
  static const String forgottenPassword = "Forgot your password ?";
  static const String alreadyHaveAnAccount = "Already have an account ?";
  static const String dontHaveAnAccount = "Don't have an account yet ?";

  //search
  static const String noResultFound = "No Result Found";

  //tabs
  static const String home = "Home";
  static const String myLists = "My Lists";
  static const String browse = "Browse";
  static const String settings = "Settings";

  //anime details
  static const String numberOfEpisodes = "Number of Episodes";
  static const String episodeTitle = "Episodes";
  static const String publisherName = "Editor";
  static const String kimetsuNoYaibaTitle = "Kimetsu No Yaiba";
  static const String kimetsuNoYaibaS2Title = "Kimetsu No Yaiba : Yuukaku-hen";
  static const String narutoTitle = "Naruto";
  static const String quintessentialQuintupletsTitle = "Quintessential Quintuplets";
  static const String quintessentialQuintupletsS2Title = "Quintessential Quintuplets 2";
  static const String karakaiJouzuNoTakagisanTitle = "Karakai Jouzu No Takagi-san";

  //formating
  static const String titleFormat = "title";
  static const String imageURLFormat = "imageURL";
  static const String descriptionFormat = "description";
  static const String publisherFormat = "publisher";
  static const String tagsFormat = "tags";

  //SharedPreferences
  static const String historyListKey = "historyList";

  //Firebase error
  static const String errorFirebaseInit = "Erreur d'initialisation Firebase";
  static const String errorFirebase = "Une erreur est survenue";

  //Firebase collections & documents
  static const String animesDatabaseCollection = "AnimesDatabase";
  static const String animesDocument = "AnimesDocument";
  static const String animesCollection = "AnimesCollection";
  static const String episodesDocument = "EpisodesDocument";
  static const String episodesCollection = "EpisodesCollection";
  static const String trendingAnime = "TrendingAnime";
}

class ImagePath {
  static const String animePlaceholderThumbnail = "assets/images/anime-placeholder-thumbnail.jpg";
  static const String episodePlaceholderThumbnail = "assets/images/episode-placeholder-thumbnail.jpg";
  static const String whiteThumbnail = "assets/images/white-thumbnail.jpg";
}

class Tags {
  static const String tagTitle = "Tag";
  static const String tagThumbnail = "Tag Thumbnail";
  static const String action = "Action";
  static const String adventure = "Aventure";
  static const String comedy = "Comedie";
  static const String drama = "Drama";
  static const String fantastic = "Fantastique";
  static const String harem = "Harem";
  static const String historic = "Historique";
  static const String idols = "Idoles";
  static const String isekai = "Isekai";
  static const String magicalGirls = "Magical Girls";
  static const String mecha = "Mecha";
  static const String music = "Musique";
  static const String mystery = "Mystere";
  static const String postApocalyptic = "Post Apocalyptique";
  static const String romantic = "Romantique";
  static const String sciFi = "Sci-Fi";
  static const String seinen = "Seinen";
  static const String schoolLife = "School Life";
  static const String shoujo = "Shoujo";
  static const String shonen = "Shonen";
  static const String sliceOfLife = "Tranches de vie";
  static const String sport = "Sport";
  static const String supernatural = "Surnaturel";
  static const String thriller = "Thriller";
}

class CardType {
  static const String episodeCard = "episodeCard";
  static const String animeCard = "animeCard";
  static const String animeSearchTile = "animeSearchTile";
}