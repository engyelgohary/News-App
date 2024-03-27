// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news/catagories/category_details.dart';
import 'package:news/model/Category_DM.dart';
import 'package:news/settings/settings.dart';
import 'package:news/theme/mytheme.dart';
import '../catagories/category_fragment.dart';
import '../search/customsearchdelgate.dart';
import 'homeDrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  static String routeName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              "assets/images/pattern.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )),
            Scaffold(
              drawer: Drawer(
                child: HomeDrawer(Selected:selected),
              ),
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text( newSelected == HomeDrawer.settings ?
                AppLocalizations.of(context)!.setting
                : selectedCategory == null ?
                AppLocalizations.of(context)!.news
                    :
                  selectedCategory!.name,
                style: Theme.of(context).textTheme.titleLarge),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                        showSearch(context: context, 
                        delegate: CustomSearchdelegate());
                      },
                      child: Icon( selectedCategory != null ?
                        Icons.search_outlined
                        :null,size: 30,),
                    ),
                  )
                ],
              ),
              body:newSelected==HomeDrawer.settings?
              Settings()
              : 
              selectedCategory == null ?
              CategoryFragment(clickItem: clickItem):
               Category(cat: selectedCategory!),
            )
      ],
    );
  }

  CategoryDm? selectedCategory;

  void clickItem(CategoryDm newSelectedcategory){
    selectedCategory = newSelectedcategory;
    setState(() {
      
    });
  }
    int newSelected = HomeDrawer.categories;
  void selected(int selected){
    newSelected = selected;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {
      
    });

  }
}
