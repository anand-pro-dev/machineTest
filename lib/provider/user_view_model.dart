import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/models/auth_get_model.dart';
import '../services/models/login_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(Result user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    log(user.token.toString() + "<<<<<<<<<<<<token");
    notifyListeners();
    return true;
  }

  Future<Result> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return Result(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
