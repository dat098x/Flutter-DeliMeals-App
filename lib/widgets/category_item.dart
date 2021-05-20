import 'package:delimeals/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String id;
  String title;
  Color color;
  CategoryItem({this.id,this.title, this.color});

  void selectedCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => CategoryMealsScreen(
    //   categoryId: id,
    //   categoryTitle: title,
    // )));
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.route, arguments: {
      'id': id,
      'title': title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Text(title, style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }
}
