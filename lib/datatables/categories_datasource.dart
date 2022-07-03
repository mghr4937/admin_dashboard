import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesDatasource extends DataTableSource {
  final List<Category> categories;
  final BuildContext context;

  CategoriesDatasource(this.categories, this.context);

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
            IconButton(
                onPressed: () {
                  final dialog = AlertDialog(
                    title: const Text('Estas seguro?'),
                    content: Text('Borrar definitivamente ${category.name}?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('No')),
                      TextButton(onPressed: () {}, child: const Text('Si, borrar')),
                    ],
                  );
                  showDialog(context: context, builder: (_) => dialog);
                },
                icon: const Icon(Icons.delete_outlined),
                color: Colors.red),
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
