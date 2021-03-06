import 'package:flutter/material.dart';
import '/ui/shared/widgets/inputs/custom_inputs.dart';

class SearchText extends StatelessWidget {
  const SearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildBoxDecoration(),
      child: TextField(decoration: CustomInputs.searchInputDecoration(hint: 'Buscar', iconData: Icons.search_outlined)),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.5),
      );
}
