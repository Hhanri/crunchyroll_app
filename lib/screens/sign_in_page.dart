import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/utils/route_generator.dart';
import 'package:crunchyroll_app/widgets/button_widget.dart';
import 'package:crunchyroll_app/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
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
              const Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  Strings.signInTitle,
                  style: Theme.of(context).textTheme.headline1
                )
              ),
              //Spacer(),
              Expanded(
                flex: 7,
                child: Form(
                  key: _formKey,
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
                          _password = value;
                        }
                      ),
                      ButtonWidget(
                        buttonText: Strings.signInTitle,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_formKey.currentState!.validate()) {
                            print("email: ${_email}\npassword: ${_password}");
                            _email = "";
                            _password = "";
                          }
                        }
                      )
                    ],
                  ),
                )
              ),
              const SizedBox(
                height: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.dontHaveAnAccount,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  TextButton(
                    child: Text(
                      " " + Strings.signUpTitle,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onPressed: () => Navigator.of(context).pushNamed(SIGN_UP_PAGE),
                  )
                ],
              ),
              const Spacer(
                flex: 3
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      Strings.forgottenPassword,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
