import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas/Model/receitas/recipes_model.dart';

import '../View_Model/recipe_list_provider.dart';

class RecipesPageView extends StatefulWidget {
  RecipesModel? recipe;
  RecipesPageView({Key? key, this.recipe}) : super(key: key);

  @override
  State<RecipesPageView> createState() => _RecipesPageViewState();
}

class _RecipesPageViewState extends State<RecipesPageView> {
  late RecipeListProvider provider;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<RecipeListProvider>(context);
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          backgroundColor: Colors.amber,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.recipe?.title ?? '',
            style: const TextStyle(
                fontFamily: 'Paris',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 40),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text('Ingredientes', style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.amber,
                  fontFamily: 'Paris'),),
              Text(widget.recipe?.ingredients ?? ''),
              const SizedBox(
                height: 10,
              ),
              const Text('Modo de Fazer', style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.amber,
                  fontFamily: 'Paris'),),
              Text(widget.recipe?.todo ?? ''),
            ],
          ),
        )));

    //   child: ListView.builder(
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           title: Text(provider.getListRecipe?[index].title ?? ""),
    //           leading: Image.asset(provider.getListRecipe?[index].image ?? ''),
    //         );
    //       },
    //       itemCount: provider.getListRecipe?.length),
    // );
  }
}
