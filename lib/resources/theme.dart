import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: 'TCM',
  primaryColor: MyColors.primaryColor,
  scaffoldBackgroundColor: MyColors.backgroundColor,
  textTheme: const TextTheme(
    headline1: MyTextStyles.title1,
    headline2: MyTextStyles.title2,
    headline3: MyTextStyles.title3,
    bodyText1: MyTextStyles.body1,
    bodyText2: MyTextStyles.link1
  ),
  hoverColor: MyColors.hover,
  unselectedWidgetColor: MyColors.primaryColor,
  iconTheme: const IconThemeData(
      color: MyColors.iconColor
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: MyColors.containerColor,
    filled: true,
    hintStyle: MyTextStyles.hintText,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
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
      side: const BorderSide(
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
    style:
      TextButton.styleFrom(
      padding: EdgeInsets.zero,
      textStyle: MyTextStyles.link1,
      primary: Colors.white,
    )
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: MyShapes.cardBorders
    ),
    color: MyColors.containerColor
  )



);

class MyColors {
  static const Color backgroundColor = Colors.black; //const Color(0xff0e1623);
  static const Color primaryColor = Color(0xffff6600);
  static Color containerColor =  const Color(0xff334F6C).withOpacity(0.8);
  static const Color containerColor2 = Color(0xFF303030);
  static const Color fontColor2 = Color(0xff0080ff);//.withOpacity(0.8);
  static const fontColor1 = Color(0xffffffff);
  static const hintTextColor = Color(0xff5b6f8e);
  static const hover = Color(0xffff9100);
  static const iconColor = primaryColor;
}

class MyTextStyles {

  static const TextStyle hintText = TextStyle(
    fontFamily: 'TCM',
    fontStyle: FontStyle.italic,
    fontSize: 26,
    color: MyColors.hintTextColor
  );

  static const TextStyle title1 = TextStyle(
    fontFamily: 'TCM',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 23,
    color: MyColors.fontColor1
  );

  static const TextStyle title2 = TextStyle(
    fontFamily: 'TCM',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 23,
    color: MyColors.fontColor2
  );

  static const TextStyle title3 = TextStyle(
      fontFamily: 'TCM',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: MyColors.fontColor1
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: 'TCM',
    fontStyle: FontStyle.italic,
    fontSize: 18,
    color: MyColors.fontColor1
  );

  static const TextStyle link1 = TextStyle(
    fontFamily: 'TCM',
    fontStyle: FontStyle.italic,
    fontSize: 18,
    color: MyColors.primaryColor
  );
}

class MyShapes {
  static BorderRadiusGeometry checkboxBorders = BorderRadius.circular(5.0);
  static BorderRadiusGeometry circularBorders = BorderRadius.circular(2.0);
  static Radius radiusCircular = const Radius.circular(2.0);
  static BorderRadiusGeometry cardBorders = BorderRadius.zero;
  static BorderRadius circularBordersClipRRect = BorderRadius.circular(4);
}

class MySizes {
  static double minimumHeightInput = 40;
}