import 'package:admin_dashboard/ui/shared/widgets/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';

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
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: ((_) => CategoryModal(category: category)),
                      backgroundColor: Colors.transparent);
                },
                icon: const Icon(Icons.edit_outlined),
                color: Colors.blue),
            IconButton(
                onPressed: () {
                  final dialog = AlertDialog(
                    title: const Text('Seguro que desea borrar?'),
                    content: Text(category.name),
                    actions: [
                      CustomIconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icons.arrow_back_outlined,
                        text: 'No',
                        color: Colors.green,
                      ),
                      const SizedBox(height: 5),
                      CustomIconButton(
                        onPressed: () async {
                          final navigator = Navigator.of(context);
                          await Provider.of<CategoriesProvider>(context, listen: false).deleteCategory(category.id);
                          navigator.pop();
                        },
                        text: 'Borrar',
                        icon: Icons.highlight_remove_outlined,
                        color: Colors.red,
                      ),
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
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;
}
