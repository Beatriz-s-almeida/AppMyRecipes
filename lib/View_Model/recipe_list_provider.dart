import 'package:flutter/material.dart';
import 'package:receitas/Model/receitas/recipes_repository.dart';
import '../Model/receitas/recipes_model.dart';

class RecipeListProvider with ChangeNotifier {
  List<RecipesModel>? _listRecipesModel;

  final RecipeRepository _recipeRepository = RecipeRepository();

  int? status = 0;

  List<RecipesModel>? get getListRecipe => _listRecipesModel;

  Future<void> getRecipes() async {
    status = 1;
    _listRecipesModel = null;
    await Future.delayed(Duration(milliseconds: 200));
    notifyListeners();
    try {
      _listRecipesModel = await _recipeRepository.getRecipe();
      status = 2;
    } catch (e) {
      status = 3;
      print(e);
    }
    notifyListeners();
  }
}
