import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_damatag_task/core/themes/light-colors.dart';

import 'text_style.dart';


final ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
primarySwatch: primaryColor,
  scaffoldBackgroundColor:primaryColorLight,

  iconTheme: const IconThemeData (
    color: primaryColor,
    size: 40,
  ),
  appBarTheme: AppBarTheme(

    elevation: 5,
    color: primaryColor,
    titleTextStyle: appBartTextStyle(),
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 30,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.white,
      size: 30,
    ),
    systemOverlayStyle:  const SystemUiOverlayStyle(

      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    elevation: 30,
    iconSize: 25,
    foregroundColor: Colors.white,
  ),


);
