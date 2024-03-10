// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/theme/mytheme.dart';

class Tabitem extends StatelessWidget {
  Source source;
bool isSelected;
Tabitem({required this.isSelected,required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? MyTheme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: MyTheme.primaryColor,
        )
      ),
      child: Text(source.name??"",style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: isSelected?MyTheme.whiteColor:MyTheme.primaryColor,
        fontSize: 18
      ),),
    );
  }
}