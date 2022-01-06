import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/home_page.dart';
import 'package:crunchyroll_app/screens/sign_in_page.dart';
import 'package:crunchyroll_app/screens/unknown_screen.dart';
import 'package:crunchyroll_app/widgets/browse_page_widgets.dart';
import 'package:flutter/material.dart';

class ViewScreen extends StatefulWidget {
  int currentIndex;
  ViewScreen({
    Key? key,
    required this.currentIndex
  }) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {

  final List<Widget> screens = [
    HomeScreen(homePlaylist: homePlaylists),
    UnknownScreen(),
    BrowseGenresScreenWidget(),
    SignInScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: screens,
        index: widget.currentIndex,
      ),
      bottomNavigationBar: _BottomNavBar(
        onTap: (index){
          setState(() {
            widget.currentIndex = index;
          });
        },
        currentIndex: widget.currentIndex,
      ),
    );
  }
}

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
