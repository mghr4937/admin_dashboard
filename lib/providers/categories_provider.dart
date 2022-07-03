import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categories = [];

  getCategories() async {
    final response = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(response);

    categories = [...categoriesResponse.categories];
    print(categories);

    notifyListeners();
  }
}
