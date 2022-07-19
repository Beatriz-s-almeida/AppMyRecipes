class RecipesModel {
  String? title;
  String? ingredients;
  String? todo;
  String? image;

  RecipesModel({this.title, this.todo, this.image, this.ingredients});

  toJson() {
    Map<String, dynamic> json = {};
    json['title'] = title;
    json['ingredients'] = ingredients;
    json['todo'] = todo;
    json['image'] = image;

    return json;
  }

  RecipesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    ingredients = json['ingredients'];
    todo = json['todo'];
    image = json['image'];
  }
}
