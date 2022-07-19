import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas/Components/alert_dialog_widget.dart';
import 'package:receitas/Validators/validators_utils.dart';
import 'package:receitas/Views/todo_page_view.dart';
import '../Components/button_default.dart';
import '../View_Model/recipe_register_provider.dart';
import 'ingrendients_page_view.dart';

class NewRecipePageView extends StatefulWidget {
  const NewRecipePageView({Key? key}) : super(key: key);

  @override
  State<NewRecipePageView> createState() => _NewRecipePageViewState();
}

class _NewRecipePageViewState extends State<NewRecipePageView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final RecipeRegisterProvider provider =
        Provider.of<RecipeRegisterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: AlertDialogWidget(),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        backgroundColor: Colors.amber,
        elevation: 0,
        title: const Text(
          'Nova receita',
          style: TextStyle(
              fontFamily: 'Paris',
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: TextFormField(
                validator: ValidatorUtils.validadeNull,
                onSaved: (value) {
                  provider.setTitle = value ?? '';
                },
                decoration: InputDecoration(
                  hintText: 'Titulo da receita',
                  border: OutlineInputBorder(),
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonDefault(
                    title: 'Ingredientes',
                    onPressed: () async {
                      if (_formKey.currentState!.validate() == false) {
                        return;
                      }
                      _formKey.currentState!.save();

                      // await provider.postRecipe();

                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => IngredientsPageView()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  validatetitle(RecipeRegisterProvider provider) async {
    if (_formKey.currentState!.validate() == false) {
      return;
    }
    _formKey.currentState!.save();

    // await provider.postRecipe();

    Navigator.push((context),
        MaterialPageRoute(builder: (context) => IngredientsPageView()));
  }

// _success() {
//   Navigator.push(
//       (context),
//       MaterialPageRoute(
//           builder: (context) => IngredientsPageView()));
// }
}
