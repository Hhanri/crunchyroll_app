import 'package:crunchyroll_app/resources/theme.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "test"
              ),
            ),
          ),
          Expanded(child: Container())
        ],
      )
    );
  }
}
