import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: 'TCM',
  primaryColor: MyColors.primaryColor,
  scaffoldBackgroundColor: MyColors.backgroundColor,
  textTheme: TextTheme(
    headline1: MyTextStyles.title1,
    bodyText1: MyTextStyles.body1,
    bodyText2: MyTextStyles.link1
  ),
  hoverColor: MyColors.hover,
  unselectedWidgetColor: MyColors.primaryColor,
  iconTheme: IconThemeData(
      color: MyColors.iconColor
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: MyColors.containerColor,
    filled: true,
    hintStyle: MyTextStyles.hintText,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: MyColors.primaryColor,
          style: BorderStyle.solid,
          width: 1
      ),
      borderRadius: BorderRadius.all(
          MyShapes.radiusCircular
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        MyShapes.radiusCircular
      )
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      side: BorderSide(
        width: 2,
        color: Colors.black
      ),
      primary: MyColors.primaryColor,
      textStyle: MyTextStyles.title1,
      shape: RoundedRectangleBorder(
        borderRadius: MyShapes.circularBorders
      )
    )
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      textStyle: MyTextStyles.link1,
      primary: MyColors.primaryColor
    )
  ),



);

class MyColors {
  static const Color backgroundColor = const Color(0xff0e1623);
  static const Color primaryColor = const Color(0xffff6600);
  static Color containerColor = const Color(0xff486181).withOpacity(0.69);
  static const Color fontColor2 = const Color(0xff0080ff);//.withOpacity(0.8);
  static const fontColor1 = const Color(0xffffffff);
  static const hintTextColor = const Color(0xff5b6f8e);
  static const hover = const Color(0xffff9100);
  static const iconColor = primaryColor;
}

class MyTextStyles {

  static const TextStyle hintText = const TextStyle(
    fontFamily: 'TCM',
    fontStyle: FontStyle.italic,
    fontSize: 26,
    color: MyColors.hintTextColor
  );

  static const TextStyle title1 = const TextStyle(
    fontFamily: 'TCM',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 23,
    color: MyColors.fontColor1
  );

  static const TextStyle title2 = const TextStyle(
    fontFamily: 'TCM',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 23,
    color: MyColors.fontColor2
  );

  static const TextStyle body1 = const TextStyle(
    fontFamily: 'TCM',
    fontStyle: FontStyle.italic,
    fontSize: 18,
    color: MyColors.fontColor1
  );

  static const TextStyle link1 = const TextStyle(
    fontFamily: 'TCM',
    fontStyle: FontStyle.italic,
    fontSize: 18,
    color: MyColors.primaryColor
  );
}

class MyShapes {
  static BorderRadiusGeometry checkboxBorders = BorderRadius.circular(5.0);
  static BorderRadiusGeometry circularBorders = BorderRadius.circular(2.0);
  static Radius radiusCircular = Radius.circular(2.0);
}

class MySizes {
  static double minimumHeightInput = 40;
}