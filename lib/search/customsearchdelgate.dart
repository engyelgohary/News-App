import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewResponse.dart';
import 'package:news/news/new_item.dart';
import '../theme/mytheme.dart';

class  CustomSearchdelegate extends SearchDelegate{
  @override

  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: MyTheme.primaryColor,
        shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search_outlined,size: 30,),
      ),
    ];
  }
  late Future<NewResponse?> getNewsDataModel;

  CustomSearchdelegate(){
    getNewsDataModel = ApiManger.getNewsbyId(searchKeyword: "");
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.clear,
        size: 32,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getNewsbyId(searchKeyword: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(
            backgroundColor: MyTheme.whiteColor,
            color: MyTheme.primaryColor,
          ));
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }
        var articles = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color:  MyTheme.primaryColor,
                thickness: 2,
              );
            },
            itemBuilder: (context, index) {
              var newsItem = articles[index];
              return News_item(news: newsItem);
            },
            itemCount: articles.length,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const
    Center(
      child: Text('',),
    );
  }

}