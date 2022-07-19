import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas/Views/recipes_page_view.dart';
import '../View_Model/recipe_list_provider.dart';

class HomeWidgets extends StatefulWidget {
  const HomeWidgets({Key? key}) : super(key: key);

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  late RecipeListProvider provider;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider =
        Provider.of<RecipeListProvider>(context);
    return Card(
      elevation: 2,
      child: Column(
        children: provider.getListRecipe?.map((e) {
              return ListTile(
                // trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete, color: Colors.red, ),),
                title: Text(e.title ?? ""),
                onTap: (){Navigator.push(
                    (context),
                    MaterialPageRoute(
                        builder: (context) => RecipesPageView(recipe: e,)));},
                leading: const SizedBox(child:Icon(Icons.fullscreen_rounded), height: 50, width: 50,),
              );
            }).toList() ??
            [
              Text("LISTA VAZIA")
            ],
      ));
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
