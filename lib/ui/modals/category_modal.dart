import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/buttons/curtom_outlined_button.dart';
import 'package:admin_dashboard/ui/shared/widgets/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/shared/widgets/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  final Category? category;

  const CategoryModal({Key? key, this.category}) : super(key: key);

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String name = '';
  String? id;

  @override
  void initState() {
    id = widget.category?.id;
    name = widget.category?.name ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: buildBoxDecoration(),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.category?.name ?? 'Añadir categoría',
              style: CustomLabels.h2.copyWith(color: Colors.white),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.close_outlined,
                color: Colors.white,
                size: 40,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Divider(color: Colors.white.withOpacity(0.4)),
        const SizedBox(height: 20),
        TextFormField(
          initialValue: widget.category?.name ?? '',
          onChanged: (value) => name = value,
          decoration: CustomInputs.loginInputDecoration(
            hint: 'Nombre',
            label: 'Categoría',
            iconData: Icons.category_outlined,
            color: Colors.white,
          ),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.topRight,
          child: CustomOutlinedButton(
            text: 'Guardar',
            onPressed: () async {
              final navigator = Navigator.of(context);
              if (id == null) {
                await categoriesProvider.createCategory(name);
              } else {
                await categoriesProvider.updateCategory(id!, name);
              }
              navigator.pop();
            },
            color: Colors.blue.shade600,
          ),
        ),
      ]),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      color: Colors.green,
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
