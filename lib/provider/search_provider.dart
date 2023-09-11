import 'package:flutter/material.dart';
import 'package:test_mvvm/services/api/search.dart';
import 'package:test_mvvm/services/models/home_list_model.dart';

class SearchProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Result> nameGet = [];
  List<Result> filteredName = [];
  HomeListItems searchData = HomeListItems();

  SearchProvider() {
    searchApiFrom();
  }

  Future<void> searchApiFrom() async {
    isLoading = true;
    notifyListeners();
    searchData = await ApiServicesHome().homeTab();
    nameGet = searchData.result ?? [];
    filteredName = nameGet;
    isLoading = false;
    notifyListeners();
  }

  void searchTickets(String query) {
    if (query.isNotEmpty) {
      filteredName = nameGet
          .where((firstNameSS) => firstNameSS.firstName!
              .toLowerCase()
              .startsWith(query.toLowerCase()))
          .toList();
    } else {
      filteredName = nameGet;
    }
    notifyListeners();
  }
}
