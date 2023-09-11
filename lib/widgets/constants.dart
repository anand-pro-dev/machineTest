import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static const kwhiteColor = Colors.white;
  static const kAmberColor = Colors.amber;
  static const kGreeyColor = Colors.grey;
}

class AppConstants {
  static const baseUrl = "https://sebateks.pl/sebateks/webservice";
  static const logInUrl = "$baseUrl/login";
  static const homeListUrl = "$baseUrl/get_companyList";
  static const addDetailsListUrl = "$baseUrl/add_company";
}

final statesBarTheme =
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  statusBarColor: Color.fromARGB(250, 255, 255, 255),
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
));
