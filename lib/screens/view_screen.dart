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
        return ViewScreenScaffoldWidget(appBarTitles: appBarTitles, screens: screens, bottomNavBarItems: bottomNavBarItems, controller: controller,);
      }
    );
  }
}

class ViewScreenScaffoldWidget extends StatelessWidget {
  final List<String> appBarTitles;
  final List<Widget> screens;
  final List<BottomNavigationBarItem> bottomNavBarItems;
  final ViewScreenController controller;
  const ViewScreenScaffoldWidget({
    Key? key,
    required this.appBarTitles,
    required this.screens,
    required this.bottomNavBarItems,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        actions: const [
          SearchButtonWidget()
        ],
      ),
      body: IndexedStack(
        children: screens,
        index: controller.tabIndex,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        bottomNavBarItems: bottomNavBarItems, 
        controller: controller,
      )
    );
  }
}

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showSearch(context: context, delegate: AnimeSearch() );
      },
      child: const Icon(
        Icons.search_outlined
      )
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  final ViewScreenController controller;
  final List<BottomNavigationBarItem> bottomNavBarItems;
  const BottomNavigationBarWidget({
    Key? key,
    required this.bottomNavBarItems,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: controller.changeTabIndex,
      currentIndex: controller.tabIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.containerColor,
      selectedItemColor: MyColors.primaryColor,
      unselectedItemColor: Colors.white.withOpacity(0.8),
      items: bottomNavBarItems
    );
  }
}
