import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas/Components/alert_dialog_widget.dart';
import 'package:receitas/Components/button_default.dart';
import 'package:receitas/Components/ingredients_widgets.dart';
import 'package:receitas/View_Model/recipe_register_provider.dart';
import 'package:receitas/Views/todo_page_view.dart';

class IngredientsPageView extends StatefulWidget {
  const IngredientsPageView({Key? key}) : super(key: key);

  @override
  State<IngredientsPageView> createState() => _IngredientsPageViewState();
}

class _IngredientsPageViewState extends State<IngredientsPageView> {
  List<IngredientsWidgets> ingredientes = [ IngredientsWidgets(),];
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AlertDialogWidget(),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        backgroundColor: Colors.amber,
        elevation: 0,
        title: const Text(
          'Ingredientes',
          style: TextStyle(
              fontFamily: 'Paris',
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: ingredientes.map((e) => e).toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonDefault(title: 'Novo Ingrediente', onPressed: () {
                  ingredientes.add(const IngredientsWidgets());
                  setState((){});
                }),
                ButtonDefault(title: 'Modo de Fazer', onPressed: () async {
                  if (_formKey.currentState!.validate() == false) {
                    return;
                  }

                  _formKey.currentState!.save();

                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => ToDoPageView()));
                },)
              ],
            )
          ],
        ),
      ),
    );
  }
}
