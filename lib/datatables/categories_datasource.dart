import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesDatasource extends DataTableSource {
  final List<Category> categories;

  CategoriesDatasource(this.categories);

  @override
  DataRow getRow(int index) {
    final category = categories[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(category.id)),
        DataCell(Text(category.name)),
        DataCell(Text(category.user.name)),
        DataCell(Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined), color: Colors.blue),
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outlined), color: Colors.red),
          ],
        )),
      ],
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categories.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
