import 'package:flutter/material.dart';
import 'package:news/mytheme.dart';

class Home extends StatelessWidget {
  static String routeName = "Home";

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
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text('News App',
                style: Theme.of(context).textTheme.titleLarge),
              ),
            )
      ],
    );
  }
}
