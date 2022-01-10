import 'package:crunchyroll_app/controller/view_screen_controller.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/home_page.dart';
import 'package:crunchyroll_app/screens/search_page.dart';
import 'package:crunchyroll_app/screens/sign_in_page.dart';
import 'package:crunchyroll_app/screens/unknown_screen.dart';
import 'package:crunchyroll_app/screens/browse_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ViewScreen extends StatelessWidget {
  ViewScreen({
    Key? key,
  }) : super(key: key);

  final List<String> appBarTitles = [
    Strings.home,
    Strings.myLists,
    Strings.browse,
    Strings.settings
  ];

  final List<Widget> screens = [
    HomeScreen(homePlaylist: homePlaylists),
    const UnknownScreen(),
    const BrowseGenresScreen(),
    const SignInScreen()
  ];

  final List<BottomNavigationBarItem> bottomNavBarItems = const[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined
      ),
      label: Strings.home
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.bookmark_border_outlined
      ),
      label: Strings.myLists
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.border_all_outlined
      ),
      label: Strings.browse
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle_rounded
      ),
      label: Strings.settings
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewScreenController>(
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: MyColors.backgroundColor,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                appBarTitles[controller.tabIndex]
              )
            ),
            actions: [
              TextButton(
                onPressed: () {
                  showSearch(context: context, delegate: AnimeSearch() );
                  //Get.to(SearchBarScreen());
                },
                child: const Icon(
                  Icons.search_outlined
                )
              )
            ],
          ),
          body: IndexedStack(
            children: screens,
            index: controller.tabIndex,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: MyColors.containerColor,
            selectedItemColor: MyColors.primaryColor,
            unselectedItemColor: Colors.white.withOpacity(0.8),
            items: bottomNavBarItems
          )
        );
      }
    );
  }
}
