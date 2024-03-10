// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news/theme/mytheme.dart';

class HomeDrawer extends StatelessWidget {
  Function Selected;
static int categories = 1;
static int settings = 2;
  HomeDrawer({required this.Selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*.08),
          color: MyTheme.primaryColor,
          child: Text("News App!",style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: (){
              Selected(categories);
            },
            child: Row(
              children: [
                 Icon(Icons.list),
                 SizedBox(width: 10,),
                Text("Categories",style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
          ),
        ),
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: InkWell(
            onTap: () {
              Selected(settings);
            },
             child: Row(
              children: [
                 Icon(Icons.settings),
                 SizedBox(width: 10,),
           
                Text("Settings",style: Theme.of(context).textTheme.titleMedium,)
              ],
                     ),
           ),
         )
      ],
    );
  }
}