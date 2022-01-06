import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/home_page.dart';
import 'package:crunchyroll_app/screens/view_screen.dart';
import 'package:crunchyroll_app/utils/route_generator.dart';
import 'package:crunchyroll_app/widgets/browse_page_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return MaterialApp(
      title: Strings.appTitle,
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: ViewScreen(currentIndex: currentIndex,), // HomeScreen(homePlaylist: homePlaylists),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

