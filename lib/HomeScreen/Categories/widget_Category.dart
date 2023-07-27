import 'package:flutter/material.dart';

import 'Categories.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;

  CategoryWidget(this.category, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(index % 2 == 0 ? 18 : 0),
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 18))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/${category.imageName}',
            height: 160,
            fit: BoxFit.fitHeight,
          ),
          Text(
            category.title,
            style: TextStyle(color: Colors.white, fontSize: 24),
          )
        ],
      ),
    );
  }
}
