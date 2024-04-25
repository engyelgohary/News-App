// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news/catagories/category_detials_model_view.dart';
import 'package:news/model/Category_DM.dart';
import 'package:news/tabs/tab_widget.dart';
import 'package:news/theme/mytheme.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  static String routeName = "Category";
  CategoryDm cat;
  Category({
    required this.cat,
  });

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    modelView.getSource(widget.cat.id);
  }

  CategoryDetialsModelView modelView = CategoryDetialsModelView();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => modelView,
        child: Consumer<CategoryDetialsModelView>(
          builder: (context, value, child) {
            if (modelView.errorMessage != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(modelView.errorMessage!),
                  ElevatedButton(
                      onPressed: () {
                        modelView.getSource(widget.cat.id);
                        setState(() {});
                      },
                      child: const Text('Try Again'))
                ],
              );
            } else if (modelView.listSource == null) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: MyTheme.whiteColor,
                  color: MyTheme.primaryColor,
                ),
              );
            } else {
              return TabWidget(sourceList: modelView.listSource!);
            }
          },
        ));

    //   FutureBuilder<SourceResponse?>(
    //     future: ApiManger.getSources(widget.cat.id),
    //      builder: (context, snapshot) {
    //        if(snapshot.connectionState==ConnectionState.waiting){
    //         return Center(
    //           child: CircularProgressIndicator(
    //             backgroundColor: MyTheme.whiteColor,
    //             color: MyTheme.primaryColor,
    //           ),
    //         );
    //        } else if(snapshot.hasError){
    //            return Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //              const Text('Smothing went Wrong'),
    //               ElevatedButton(onPressed: (){
    //                 ApiManger.getSources(widget.cat.id);
    //                 setState(() {
    //
    //                 });
    //               }, child: const Text('Try Again'))
    //             ],
    //            );
    //        }
    //        if(snapshot.data?.status !='ok'){
    //           return Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Text(snapshot.data?.message ??'Smothing went Wrong'),
    //               ElevatedButton(onPressed: (){
    //                   ApiManger.getSources(widget.cat.id);
    //                   setState(() {
    //
    //                   });
    //               }, child: const Text('Try Again'))
    //             ],
    //            );
    //        }
    //        var sourceList = snapshot.data?.sources??[];
    //        return TabWidget(sourceList: sourceList,);
    //      },
    // );
  }
}
