// ignore_for_file: use_key_in_widget_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/cubit/news_model_view_cubit.dart';
import 'package:news/news/new_item.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/theme/mytheme.dart';

class News_details extends StatefulWidget {
  Source source;
  News_details({required this.source, });

  @override
  State<News_details> createState() => _News_detialsState();
}

class _News_detialsState extends State<News_details> {
  NewsModelViewCubit modelView = NewsModelViewCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    modelView.getNews(widget.source.id!);
  }
  Widget build(BuildContext context) {
    return BlocBuilder<NewsModelViewCubit,NewsModelViewState>(
      bloc: modelView,
      builder: (context, state) {
      if(state is NewsLoadingState){
        return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: MyTheme.whiteColor,
                        color: MyTheme.primaryColor,
                      ),
                    );
      }
      else if(state is NewsErrorState){
        return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(state.errorMessage),
                          ElevatedButton(onPressed: (){
                            modelView.getNews(widget.source.id!);
                            setState(() {

                            });
                          }, child: const Text('Try Again'))
                        ],
                       );
      }
      else if (state is NewsSuccessState){
        return ListView.separated(itemBuilder: (context, index) {
                   return News_item(news: state.newsList[index]);
                 },
                 itemCount: state.newsList.length,
                 separatorBuilder: (context, index) {
                  return Divider(
                        color:  MyTheme.primaryColor,
                        thickness: 2,
                      );
                 },
                 );
      }
      return Container();
    },);


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
