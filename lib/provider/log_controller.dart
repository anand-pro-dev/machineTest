import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvm/provider/user_view_model.dart';
import 'package:test_mvvm/services/api/fatch_api.dart';
import 'package:test_mvvm/services/models/add_model.dart';
import 'package:test_mvvm/widgets/utils/utils.dart';

import '../home/home_page.dart';
import '../services/models/auth_get_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = ApiServices();

  bool _loading = false;
  bool get loading => _loading;
// UserModel _response = UserModel();
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<UserModel> loginApi(data, BuildContext context) async {
    setLoading(true);

    try {
      var value = await _myRepo.logInApi(data);
      setLoading(false);

      if (value.status == "1") {
        //
        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);
        userPreference.saveUser(Result(token: value.result!.token!.toString()));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        Utils.flushBarErrorMessage('Login Successfully', context, Colors.green);
      } else {
        Utils.flushBarErrorMessage(
            value.message.toString(), context, Colors.red);
      }

      if (kDebugMode) {
        print(value.toString());
      }

      return value; // Return the UserModel
    } catch (error) {
      setLoading(false);
      log(error.toString());
      Utils.flushBarErrorMessage(error.toString(), context, Colors.red);

      if (kDebugMode) {
        print(error.toString());
      }

      rethrow; // Re-throw the error to handle it in the UI
    }
  }
}

class AddDetailsProvider with ChangeNotifier {
  final _myRepo = ApiServices();

  bool _loading = false;
  bool get loading => _loading;
// UserModel _response = UserModel();
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<AddDataToListModel> PostDataProvider(
      data, BuildContext context) async {
    setLoading(true);

    try {
      var value = await _myRepo.postDetails(data);
      setLoading(false);

      if (value.firstName != "") {
        //
        // final userPreference =
        //     Provider.of<UserViewModel>(context, listen: false);
        // userPreference.saveUser(Result(token: value.result!.token!.toString()));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        Utils.flushBarErrorMessage('Login Successfully', context, Colors.green);
      } else {
        Utils.flushBarErrorMessage(value.toString(), context, Colors.red);
      }

      if (kDebugMode) {
        print(value.toString());
      }

      return value; // Return the UserModel
    } catch (error) {
      setLoading(false);
      log(error.toString());
      Utils.flushBarErrorMessage(error.toString(), context, Colors.red);

      if (kDebugMode) {
        print(error.toString());
      }

      rethrow; // Re-throw the error to handle it in the UI
    }
  }
}
