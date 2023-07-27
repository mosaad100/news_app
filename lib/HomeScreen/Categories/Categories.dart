import 'package:flutter/material.dart';

import 'widget_Category.dart';

class Categories extends StatelessWidget {
  var categories = Category.getallCategories();
  Function OnCategoryClickCallBack;

  Categories(this.OnCategoryClickCallBack);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemBuilder: (_, index) {
          return InkWell(
              onTap: () {
                OnCategoryClickCallBack(categories[index]);
              },
              child: CategoryWidget(categories[index], index));
        },
        itemCount: categories.length,
      ),
    );
  }
}

class Category {
  String id;
  String title;
  String imageName;
  Color color;

  Category(
      {required this.id,
      required this.title,
      required this.imageName,
      required this.color});

  static List<Category> getallCategories() {
    //list to put in it our categories
    return [
      Category(
          id: 'sports',
          imageName: 'ball.png',
          title: 'Sports',
          color: Color(0xFFC91C22)),
      Category(
          id: 'entertainment',
          imageName: 'general.png',
          title: 'general',
          color: Color(0xFF00008b)),
      Category(
          id: 'health',
          imageName: 'health.png',
          title: 'Health',
          color: Color(0xFFED1E79)),
      Category(
          id: 'business',
          imageName: 'bussines.png',
          title: 'Business',
          color: Color(0xFFCF7E48)),
      Category(
          id: 'general',
          imageName: 'environment.png',
          title: 'Technology',
          color: Color(0xFF4882CF)),
      Category(
          id: 'science',
          imageName: 'science.png',
          title: 'Science',
          color: Color(0xFFF2D352)),
    ];
  }
}
