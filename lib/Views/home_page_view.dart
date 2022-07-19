import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas/Components/button_default.dart';
import 'package:receitas/Components/home_widgets.dart';
import 'package:receitas/View_Model/recipe_list_provider.dart';
import 'package:receitas/Views/ingrendients_page_view.dart';
import 'package:receitas/Views/new_cooking_recipe_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late RecipeListProvider provider;

  @override
  void initState() {
    provider = Provider.of<RecipeListProvider>(context, listen: false);
    provider.getRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider =
        Provider.of<RecipeListProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Receitas',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.amber,
                      fontFamily: 'Paris'),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Digite a receita desejada',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon: Icon(Icons.saved_search))),
                SizedBox(height: 15,)
              ],
            ),
            Expanded(child: swithCase()),
            // Expanded(child: SingleChildScrollView(child: const HomeWidgets())),
            ButtonDefault(
                title: '+ Nova Receita',
                onPressed: () {
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => NewRecipePageView()));
                }),
          ],
        ),
      ),
    );
  }
  Widget swithCase(){
    switch(provider.status){
      case 0:
        return Container();
      case 1:
        return Center(child: CircularProgressIndicator());

      case 2:
        return RefreshIndicator(onRefresh: provider.getRecipes,
          child:Expanded(child: SingleChildScrollView(child: const HomeWidgets())));
      case 3:
        return Center(child: Text('Erro'));
      default:
        return Container();
    }
  }

  nextpage() {
    Navigator.push((context),
        MaterialPageRoute(builder: (context) => NewRecipePageView()));
  }
}
