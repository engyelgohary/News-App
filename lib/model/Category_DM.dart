
import 'package:flutter/material.dart';
import 'package:news/theme/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
  static List<CategoryDm> getCategories(BuildContext context) {
    return [
      CategoryDm(
          id: 'sports',
          name: AppLocalizations.of(context)!.sports,
          imgPath: "assets/images/ball.png",
          color: MyTheme.redColor),
      CategoryDm(
          id: 'general',
          name: AppLocalizations.of(context)!.general,
          imgPath: "assets/images/Politics.png",
          color: MyTheme.darkBlueColor),
      CategoryDm(
          id: 'health',
          name: AppLocalizations.of(context)!.health,
          imgPath: "assets/images/health.png",
          color: MyTheme.pinkColor),
      CategoryDm(
          id: 'business',
          name: AppLocalizations.of(context)!.business,
          imgPath: "assets/images/bussines.png",
          color: MyTheme.brownColor),
      CategoryDm(
          id: 'entertainment',
          name: AppLocalizations.of(context)!.entertainment,
          imgPath: "assets/images/environment.png",
          color: MyTheme.lightBlueColor),
      CategoryDm(
          id: 'science',
          name: AppLocalizations.of(context)!.science,
          imgPath: "assets/images/science.png",
          color: MyTheme.yellowColor),
      CategoryDm(
          id: 'technology',
          name: AppLocalizations.of(context)!.technology,
          imgPath: "assets/images/environment.png",
          color: MyTheme.primaryColor),
    ];
  }
}
