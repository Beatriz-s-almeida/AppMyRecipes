import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:receitas/Model/receitas/recipes_model.dart';
import 'package:receitas/Model/service/base_service.dart';

class RecipeRepository extends BaseService {
  Future<RecipesModel> registerRecipes(RecipesModel recipesModel) async {
    try {
      Response result =
          await dio.post(recipeendpoint, data: recipesModel.toJson());

      return RecipesModel.fromJson(json.decode(result.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RecipesModel>> getRecipe() async {
    try {
      List<RecipesModel> list = [];
      Response result = await dio.get(recipeendpoint);
      print('aqui');
      print(result);
      list = (result.data as List).map((e) => RecipesModel.fromJson(e)).toList();
      return list;
    } catch(e,s) {
      print(e);
      print(s);
      return [];
    }
  }
  }
