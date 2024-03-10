// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news/model/Category_DM.dart';

class CategoryItem extends StatelessWidget {
  CategoryDm category;
  int index;
CategoryItem({required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(index%2==0? 30 : 0),
          bottomRight: Radius.circular(index%2==0? 0 : 30),
          topLeft: const Radius.circular(30),
          topRight: const Radius.circular(30),
        )
      ),
      child: Column(
        children: [
          Image.asset(category.imgPath,height: MediaQuery.sizeOf(context).height*.17,),
          Text(category.name,style: Theme.of(context).textTheme.titleLarge,),
        ]),
    );
  }
}