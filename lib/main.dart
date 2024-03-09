import 'package:flutter/material.dart';
import 'package:news/home/home.dart';
import 'package:news/mytheme.dart';
import 'home/catagories/category_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Category.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        Category.routeName: (context) => Category(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
