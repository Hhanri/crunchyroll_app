import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/widgets/button_widget.dart';
import 'package:crunchyroll_app/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  String _password = "";
  String _email = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: AppConfig.heightScreen(context),
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 40
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'test',
                  style: Theme.of(context).textTheme.headline1
                )
              ),
              //Spacer(),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFieldWidget(
                      textFieldParameters: EmailTextFieldParameters(),
                      valueChanged: (String value) {
                        _email = value;
                      },
                    ),
                    TextFieldWidget(
                      textFieldParameters: PasswordTextFieldParameters(),
                      valueChanged: (String value) {
                        _email = value;
                      }
                    ),
                    ButtonWidget(buttonText: "test", onPressed: () {})
                  ],
                )
              ),
              SizedBox(
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("test")
                ],
              ),
              Spacer(
                flex: 3
              ),
              Text("test")
            ],
          ),
        ),
      ),
    );
  }
}
