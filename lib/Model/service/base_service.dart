import 'package:dio/dio.dart';

class BaseService{
  final Dio dio = Dio(
    BaseOptions(baseUrl:'https://62c5e88b134fa108c25f5a41.mockapi.io/v1/'),
  );

  var recipeendpoint = 'recipe';
}