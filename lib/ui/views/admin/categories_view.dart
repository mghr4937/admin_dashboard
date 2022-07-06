import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:admin_dashboard/ui/shared/widgets/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/shared/widgets/labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    final categories = categoriesProvider.categories;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: categoriesProvider.isAscending,
            sortColumnIndex: categoriesProvider.sortColumnIndex,
            header: Text('Categorías diponibles', style: CustomLabels.h3, maxLines: 2),
            columns: [
              DataColumn(label: Text('UID', style: CustomLabels.h3)),
              DataColumn(
                label: Text('Categoría', style: CustomLabels.h3),
                onSort: (columnIndex, _) {
                  categoriesProvider.sortColumnIndex = columnIndex;
                  categoriesProvider.sort<String>((category) => category.name);
                },
              ),
              DataColumn(
                label: Text('Creado Por', style: CustomLabels.h3),
                onSort: (columnIndex, _) {
                  categoriesProvider.sortColumnIndex = columnIndex;
                  categoriesProvider.sort<String>((category) => category.user.name);
                },
              ),
              DataColumn(label: Text('Acciones', style: CustomLabels.h3))
            ],
            source: CategoriesDatasource(categories, context),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: ((_) => const CategoryModal(category: null)),
                    backgroundColor: Colors.transparent),
                text: 'Añadir',
                icon: Icons.add_outlined,
              )
            ],
          )
        ],
      ),
    );
  }
}
