
import 'package:flutter/material.dart';
import 'package:receitas/Model/receitas/recipes_model.dart';
import 'package:receitas/Model/receitas/recipes_repository.dart';


class RecipeRegisterProvider with ChangeNotifier{
  RecipesModel _recipesModel = RecipesModel();
  final RecipeRepository _recipeRepository = RecipeRepository();

  get getRecipe => _recipesModel;

  set setTitle(String? value){
    _recipesModel.title = value;}

  set setIngredients (String? value){
    _recipesModel.ingredients = "${_recipesModel.ingredients}\r\n $value";
  }

  set setTodo (String? value){
    _recipesModel.todo = value;

  }
  set setImages (String? value){
    _recipesModel.image = value;
  }

  Future<void> postRecipe() async{
    try{
      await _recipeRepository.registerRecipes(_recipesModel);
    } catch(e){
      print(e);
    }
    notifyListeners();
  }
  void clear(){
    _recipesModel = RecipesModel();
    notifyListeners();
  }

}