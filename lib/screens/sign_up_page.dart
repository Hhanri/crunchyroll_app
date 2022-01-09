import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/utils/app_config.dart';
import 'package:crunchyroll_app/utils/navigation_utils.dart';
import 'package:crunchyroll_app/widgets/button_widget.dart';
import 'package:crunchyroll_app/widgets/checkbox_widget.dart';
import 'package:crunchyroll_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _username = "";
  bool _TOScheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: AppConfig.heightScreen(context),
          padding: const EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 40
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Text(
                Strings.signUpTitle,
                style: Theme.of(context).textTheme.headline1,
              ),
              const Spacer(),
              Expanded(
                flex: 15,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldWidget(
                        textFieldParameters: EmailTextFieldParameters(),
                        valueChanged: (String value) {
                          _email = value;
                        }
                      ),
                      TextFieldWidget(
                        textFieldParameters: UsernameTextFieldParameters(),
                        valueChanged: (String value) {
                          _username = value;
                        }
                      ),
                      TextFieldWidget(
                        textFieldParameters: PasswordTextFieldParameters(),
                        valueChanged: (String value) {
                          _password = value;
                        }
                      ),
                      TextFieldWidget(
                        textFieldParameters: PasswordTextFieldParameters(),
                        valueChanged: (String value) {
                          _confirmPassword = value;
                        }
                      ),
                      ButtonWidget(
                        buttonText: Strings.signUpTitle,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_TOScheck == true) {
                            if (_password == _confirmPassword) {
                              if (_formKey.currentState!.validate()) {
                                print("Sign up");
                              }
                            } else {
                              NavigationUtils.showMyDialog(
                                context: context,
                                bodyText: Strings.errorPasswordNotMatching
                              );
                            }
                          } else {
                            NavigationUtils.showMyDialog(
                              context: context,
                              bodyText: Strings.errorTOSCheck
                            );
                          }
                        }
                      )
                    ],
                  )
                )
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckboxWidget(
                    checked: _TOScheck,
                    valueChanged: (value) {
                      setState(() {
                        _TOScheck = value;
                      });
                    }
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _TOScheck = !_TOScheck;
                      });
                    },
                    child: Text(
                      Strings.acceptTOS,
                      style: Theme.of(context).textTheme.bodyText2
                    ),
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.alreadyHaveAnAccount,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  TextButton(
                    child: Text(
                      " " + Strings.signInTitle,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
