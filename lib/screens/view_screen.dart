import 'package:auto_route/auto_route.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/home_page.dart';
import 'package:crunchyroll_app/screens/sign_in_page.dart';
import 'package:crunchyroll_app/screens/unknown_screen.dart';
import 'package:crunchyroll_app/utils/router.gr.dart';
import 'package:crunchyroll_app/widgets/browse_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ViewScreen extends StatefulWidget {
  //int currentIndex;
  ViewScreen({
    Key? key,
  //  required this.currentIndex
  }) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {

  final List<Widget> screens = [
    HomeScreen(),
    UnknownScreen(),
    BrowseGenresScreenWidget(),
    SignInScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: MyColors.containerColor,
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: const Text("test"),
        leading: const AutoBackButton(),
      ),
      routes: const [
        HomeRouter(),
        MyListsRouter(),
        BrowseRouter(),
        SettingsRouter()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home_outlined
              ),
              title: const Text(Strings.home)
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.bookmark_border_outlined
              ),
              title: const Text(Strings.myLists)
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.border_all_outlined
              ),
              title: const Text(Strings.browse)
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.account_circle_rounded
              ),
              title: const Text(Strings.settings)
            ),
          ],
        );
      },
    );
  }
}

/*
class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const _BottomNavBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index){
        onTap(index);
      },
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.containerColor,
      selectedItemColor: MyColors.primaryColor,
      unselectedItemColor: Colors.white.withOpacity(0.8),
      items: [
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
      ],
    );
  }
}
 */