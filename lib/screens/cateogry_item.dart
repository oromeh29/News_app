import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/Category_Model.dart';

class CategoryItem extends StatelessWidget {
CategoryModel categoryModel;

CategoryItem(this.categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(topRight: Radius.circular(18),topLeft: Radius.circular(18))
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryModel.image)),
          Text(categoryModel.name,style: TextStyle(
            color: Colors.white,
            fontSize: 18
          )),
        ],
      ),
    );
  }
}
