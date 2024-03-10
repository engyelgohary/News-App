import 'package:flutter/material.dart';
import 'package:news/theme/mytheme.dart';

class CategoryDm {
  String id;
  String name;
  String imgPath;
  Color color;
  CategoryDm(
      {required this.id,
      required this.name,
      required this.imgPath,
      required this.color});
  static List<CategoryDm> getCategories() {
    return [
      CategoryDm(
          id: 'sports',
          name: 'Sports',
          imgPath: "assets/images/ball.png",
          color: MyTheme.redColor),
      CategoryDm(
          id: 'general',
          name: 'General',
          imgPath: "assets/images/Politics.png",
          color: MyTheme.darkBlueColor),
      CategoryDm(
          id: 'health',
          name: 'Health',
          imgPath: "assets/images/health.png",
          color: MyTheme.pinkColor),
      CategoryDm(
          id: 'business',
          name: 'Business',
          imgPath: "assets/images/bussines.png",
          color: MyTheme.brownColor),
      CategoryDm(
          id: 'entertainment',
          name: 'Entertainment',
          imgPath: "assets/images/environment.png",
          color: MyTheme.lightBlueColor),
      CategoryDm(
          id: 'science',
          name: 'Science',
          imgPath: "assets/images/science.png",
          color: MyTheme.yellowColor),
      CategoryDm(
          id: 'technology',
          name: 'Technology',
          imgPath: "assets/images/environment.png",
          color: MyTheme.primaryColor),
    ];
  }
}
