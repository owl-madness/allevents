import 'dart:convert';

import 'package:allevents/model/category_details_model.dart';
import 'package:allevents/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CategoryController extends ChangeNotifier {
  List<CategoryModel> categoryList = [];
  List<Item> categoryDetailsList = [];
  CategoryModel? selectedCategory;
  bool isLoading = false;

  Future<void> fetchCategoryList(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await http.get(Uri.parse(
          'https://allevents.s3.amazonaws.com/tests/categories.json'));
      print('resp: ${response.body}');
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        categoryList =
            jsonList.map((json) => CategoryModel.fromJson(json)).toList();
        if (categoryList.isNotEmpty) selectedCategory = categoryList[0];
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('exception (categ) : $e');
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCategoryDetailsList(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await http.get(Uri.parse(selectedCategory!.data!));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse['item'] != null) {
          categoryDetailsList = List<Item>.from(
              jsonResponse['item'].map((item) => Item.fromJson(item)));
        } else {
          print('JSON response does not contain items');
        }
      } else {
        print('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception fetching category details: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  void onSelectCategory(CategoryModel categoryModel, BuildContext context) {
    Navigator.pop(context);
    selectedCategory = categoryModel;
    fetchCategoryDetailsList(context);
    notifyListeners();
  }

  addToFavourites(Item eventItem) {
    
  }
}
