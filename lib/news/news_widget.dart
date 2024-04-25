// ignore_for_file: use_key_in_widget_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news/news/new_item.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/news/news_widget_view_Model.dart';
import 'package:news/theme/mytheme.dart';
import 'package:provider/provider.dart';

class News_details extends StatefulWidget {
  Source source;
  News_details({
    required this.source,
  });

  @override
  State<News_details> createState() => _News_detialsState();
}

class _News_detialsState extends State<News_details> {
  NewsDetailsViewModel viewModel = NewsDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id!);
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsDetailsViewModel>(
        builder: (context, value, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getNews(widget.source.id!);
                      setState(() {});
                    },
                    child: const Text('Try Again'))
              ],
            );
          } else if (viewModel.newsList == null) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.whiteColor,
                color: MyTheme.primaryColor,
              ),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return News_item(news: viewModel.newsList![index]);
                },
                itemCount: viewModel.newsList!.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: MyTheme.primaryColor,
                    thickness: 2,
                  );
                });
          }
        },
      ),
    );
    //   FutureBuilder<NewResponse?>(
    //     future: ApiManger.getNewsbyId(newId: widget.source.id??"",),
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
    //                 ApiManger.getNewsbyId(newId: widget.source.id??"",);
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
    //                   ApiManger.getNewsbyId(newId: widget.source.id??"");
    //                   setState(() {
    //
    //                   });
    //               }, child: const Text('Try Again'))
    //             ],
    //            );
    //        }
    //        var newList = snapshot.data?.articles ?? [];
    //        return ListView.separated(itemBuilder: (context, index) {
    //          return News_item(news: newList[index]);
    //        },
    //        itemCount: newList.length,
    //        separatorBuilder: (context, index) {
    //         return Divider(
    //               color:  MyTheme.primaryColor,
    //               thickness: 2,
    //             );
    //        },
    //        );
    //      },
    // );
  }
}
