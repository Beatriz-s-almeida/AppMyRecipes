import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas/Validators/validators_utils.dart';
import '../View_Model/recipe_register_provider.dart';

class IngredientsWidgets extends StatefulWidget {
  const IngredientsWidgets({Key? key}) : super(key: key);

  @override
  State<IngredientsWidgets> createState() => _IngredientsWidgetsState();
}

class _IngredientsWidgetsState extends State<IngredientsWidgets> {

  @override
  Widget build(BuildContext context) {
    final RecipeRegisterProvider provider =
        Provider.of<RecipeRegisterProvider>(context);
    return Column(
      children: [
        SizedBox(height: 15),
        TextFormField(
          validator: ValidatorUtils.validadeNull,
          onSaved: (value) {
            provider.setIngredients = value ?? '';
          },
          decoration: const InputDecoration(
              hintText: 'Digite o novo ingrediente',
              border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
