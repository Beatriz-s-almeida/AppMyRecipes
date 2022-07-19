import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas/Validators/validators_utils.dart';
import 'package:receitas/Views/home_page_view.dart';
import '../Components/button_default.dart';
import '../View_Model/recipe_register_provider.dart';

class ToDoPageView extends StatefulWidget {
  const ToDoPageView({Key? key}) : super(key: key);

  @override
  State<ToDoPageView> createState() => _ToDoPageViewState();
}

class _ToDoPageViewState extends State<ToDoPageView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final RecipeRegisterProvider provider =
        Provider.of<RecipeRegisterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        backgroundColor: Colors.amber,
        elevation: 0,
        title: const Text(
          'Modo de Fazer',
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
                decoration: InputDecoration(
                  hintText: 'Digite o passo a passo da sua receita',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                onSaved: (value) {
                  provider.setTodo = value ?? '';
                },
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonDefault(
                      title: 'Finalizar',
                      onPressed: () async {
                        if (_formKey.currentState!.validate() == false) {
                          return;
                        }
                        _formKey.currentState!.save();
                        await provider.postRecipe();
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => HomePageView()));

                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
//   next(){
//     Navigator.push((context), MaterialPageRoute(builder: (context)=>HomePageView()));
// }
}
