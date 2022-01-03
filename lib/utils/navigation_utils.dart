import 'package:crunchyroll_app/resources/strings.dart';
import 'package:flutter/material.dart';

class NavigationUtils {

  static void showMyDialog({
    required BuildContext context,
    required String bodyText,
    VoidCallback? onClick
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            bodyText,
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: onClick ?? () => Navigator.of(context).pop(),
                child: const Text(
                  Strings.ok,
                  textAlign: TextAlign.center,
                )
              ),
            )
          ]
        );
      }
    );
  }

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor
            )
          )
        );
      },
    );
  }

  static void hideDialog(BuildContext context) {
    //if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
    //}
  }



}