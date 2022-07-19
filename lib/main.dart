import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas/View_Model/recipe_list_provider.dart';
import 'package:receitas/View_Model/recipe_register_provider.dart';
import 'package:receitas/Views/home_page_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>RecipeRegisterProvider()),
        ChangeNotifierProvider(create: (_)=>RecipeListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Work',
        ),
        home: const HomePageView(),
      ),
    );
  }
}

