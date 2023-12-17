import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String id;
  String image;
  Color color;

  CategoryModel(this.name, this.id, this.image, this.color);
  static List<CategoryModel> get(){
    return [
      CategoryModel("Sport", "sports", "assets/images/sports.png", Colors.red),
      CategoryModel("Business", "business", "assets/images/bussines.png", Color(0xffCF7E48)),
      CategoryModel("Entertainment", "entertainment","assets/images/environment.png", Color(0xff4882CF)),
      CategoryModel("General", "general", "assets/images/politics.png", Color(0xffED1E79)),
      CategoryModel("Health", "health","assets/images/health.png", Color(0xffED1E79)),
      CategoryModel("Science", "science", "assets/images/science.png", Color(0xffF2D352)),
      CategoryModel("Technology", "technology", "assets/images/environment.png", Color(0xff4882CF)),

    ];
  }
}