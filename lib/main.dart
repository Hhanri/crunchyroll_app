import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/sign_in_page.dart';
import 'package:crunchyroll_app/screens/sign_up_page.dart';
import 'package:crunchyroll_app/utils/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

