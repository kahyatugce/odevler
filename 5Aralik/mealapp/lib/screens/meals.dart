import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/models/meal.dart';

class Meals extends StatelessWidget {
  const Meals({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    List<Meal> meals =
        mealList.where((element) => element.categoryId == category.id).toList();

    Widget widget = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => Text(meals[index].name));

    if (meals.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride hiç bir tarif bulunamadı.."),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: widget,
    );
  }
}
