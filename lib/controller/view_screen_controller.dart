import 'package:crunchyroll_app/screens/browse_page.dart';
import 'package:get/get.dart';

class ViewScreenController extends GetxController{
  int tabIndex = 0;
  void changeTabIndex(int index){
    tabIndex = index;
    update();
  }
}

class BrowseController extends GetxController{
  static const int idKey = 333;
  static const String BROWSE_GENRES_PAGE = "/browseGenres";
  static const String BROWSE_ANIMES_PAGE = "/browseAnimes";
}