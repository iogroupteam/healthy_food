class FoodModel {
  FoodModel({
    this.name,
    this.mainPic,
    this.prepare,
    this.material,
    this.materialPics,
    this.time,
    this.nutritionalValue,
  });

  String? name;
  String? mainPic;
  String? prepare;
  List<String>? material;
  List<String>? materialPics;
  int? time;
  List<NutritionalValue>? nutritionalValue;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        name: json["name"],
        mainPic: json["main_pic"],
        prepare: json["prepare"],
        material: List<String>.from(json["material"].map((x) => x)),
        materialPics: List<String>.from(json["material_pics"].map((x) => x)),
        time: json["time"],
        nutritionalValue: List<NutritionalValue>.from(
            json["Nutritional_value"].map((x) => NutritionalValue.fromJson(x))),
      );
}

class NutritionalValue {
  NutritionalValue({
    this.calories,
    this.carbohydrates,
    this.protein,
    this.fat,
  });

  String? calories;
  String? carbohydrates;
  String? protein;
  String? fat;

  factory NutritionalValue.fromJson(Map<String, dynamic> json) =>
      NutritionalValue(
        calories: json["Calories"],
        carbohydrates: json["Carbohydrates"],
        protein: json["Protein"],
        fat: json["Fat"],
      );
}
