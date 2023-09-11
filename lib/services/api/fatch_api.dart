// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:test_mvvm/services/models/add_model.dart';
import 'package:test_mvvm/services/models/auth_get_model.dart';
import 'package:test_mvvm/services/models/home_list_model.dart';
import 'package:test_mvvm/widgets/constants.dart';

class ApiServices {
  var client = http.Client();
  var tokenString;

  ///========================== logins ===================================//
  Future<UserModel> logInApi(dynamic object) async {
    var url = Uri.parse(AppConstants.logInUrl);
    var _payload = (object);

    var response = await client.post(
      url,
      body: _payload,
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      var userModel = UserModel.fromJson(responseBody);

      // log('body: ${responseBody}');
      // tokenString = userModel.result!.token!;
      // log('Token: ${tokenString}');

      return userModel;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  ///========================== Home ===================================//
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

  ///========================== Details ===================================//
  Future<AddDataToListModel> postDetails(dynamic object) async {
    var url = Uri.parse(AppConstants.addDetailsListUrl);
    // var _payload = json.encode(object);
    var _payload = (object);

    var response = await client.post(
      url,
      body: _payload,
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      log("response" + response.statusCode.toString());
      var responseBody = json.decode(response.body);
      log(response.body.toString());
      responseBody = AddDataToListModel.fromJson(responseBody);
      return responseBody;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
