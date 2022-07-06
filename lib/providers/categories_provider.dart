import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categories = [];
  bool isAscending = true;
  int? sortColumnIndex;

  getCategories() async {
    final response = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(response);

    categories = [...categoriesResponse.categories];

    notifyListeners();
  }

  Future createCategory(String name) async {
    final data = {'nombre': name};

    try {
      final response = await CafeApi.httpPost('/categorias', data);
      final newCategory = Category.fromMap(response);
      categories.add(newCategory);
      notifyListeners();
    } catch (e) {
      throw 'Error al crear categoría';
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {'id': id, 'nombre': name};
    try {
      await CafeApi.httpPut('/categorias/$id', data);

      categories = categories.map((category) {
        if (category.id != id) return category;
        category.name = name;
        return category;
      }).toList();
      notifyListeners();
    } catch (e) {
      throw 'Error al actualizar categoría';
    }
  }

  Future deleteCategory(String id) async {
    try {
      await CafeApi.httpDelete('/categorias/$id', {});

      categories.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void sort<T>(Comparable<T> Function(Category category) getField) {
    categories.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return isAscending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    isAscending = !isAscending;
    notifyListeners();
  }
}
