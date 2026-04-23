
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {

  static final ThemeData darkTheme=ThemeData(

    scaffoldBackgroundColor: AppColors.primaryColor,
    drawerTheme:DrawerThemeData(
      backgroundColor: AppColors.primaryColor
    ),
    appBarTheme:AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff1E1E1E),
      iconTheme: IconThemeData(color: Colors.white),
    ),

    textTheme: TextTheme(
        titleSmall:AppTextStyle.medium20white,
        titleMedium: AppTextStyle.medium24white,
      titleLarge: AppTextStyle.medium24black,
      bodyMedium:  AppTextStyle.bold16white,
      bodySmall: AppTextStyle.medium14white,

    ),
      cardColor: AppColors.whiteColor,
    splashColor: AppColors.primaryColor,

  );



  static final ThemeData lightTheme=ThemeData(

    scaffoldBackgroundColor:Color(0xffF4F7FF),
    appBarTheme:AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xffF4F7FF),
        iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
        titleSmall:AppTextStyle.medium20black,
      titleMedium: AppTextStyle.medium24black,
      titleLarge: AppTextStyle.medium24black,
      bodyMedium:  AppTextStyle.bold16Black,
      bodySmall: AppTextStyle.medium14Black,
    ),
    cardColor: AppColors.primaryColor,
    splashColor: AppColors.whiteColor,

  );
}