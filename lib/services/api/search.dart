// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:test_mvvm/services/models/add_model.dart';
import 'package:test_mvvm/services/models/home_list_model.dart';

import 'package:test_mvvm/widgets/constants.dart';

class ApiServicesHome {
  var client = http.Client();
  var tokenString;

  Future<HomeListItems> homeTab() async {
    try {
      final response = await http.get(Uri.parse(AppConstants.homeListUrl));

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        log(response.body.toString());

        return HomeListItems.fromJson(result);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (error) {
      log('An error occurred: $error');
      throw Exception('An error occurred while fetching data');
    }
  }
}
