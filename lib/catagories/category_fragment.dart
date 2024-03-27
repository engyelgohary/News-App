// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news/catagories/category_item.dart';
import 'package:news/model/Category_DM.dart';

class CategoryFragment extends StatelessWidget {
var category = CategoryDm.getCategories();
Function clickItem;
CategoryFragment({required this.clickItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Pick your Category \n of interest",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize:25 ),),
          Expanded(
            child: GridView.builder(gridDelegate:
             const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing:15 ,mainAxisSpacing:15 ,),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                        clickItem(category[index]);
                  },
                  child: CategoryItem(category: category[index], index: index));
              },
              itemCount: category.length,
              ),
          )
        ],
      ),
    );
  }
}