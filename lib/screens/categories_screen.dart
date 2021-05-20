import 'package:delimeals/meal_data.dart';
import 'package:delimeals/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GridView(
        padding: EdgeInsets.all(10),
        children:
          DUMMY_CATEGORIES.map((category) =>
            CategoryItem(
              id: category.id,
              title: category.title,
              color: category.color,
            )
          ).toList()
        ,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15
        ),
      ),
    );
  }
}
