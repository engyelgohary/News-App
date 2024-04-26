// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/Category_DM.dart';
import '../tabs/tab_widget.dart';
import '../theme/mytheme.dart';
import 'cubit/category_detials_model_view_cubit.dart';


class Category extends StatefulWidget {
  static String routeName = "Category";
  CategoryDm cat;
  Category({required this.cat,});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  CategoryDetialsModelViewCubit modelView = CategoryDetialsModelViewCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    modelView.getSources(widget.cat.id);
  }
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetialsModelViewCubit,CategoryDetialsModelViewState>(
      bloc: modelView,
      builder: (context, state) {
      if(state is LoadingState){
        return  Center(
                      child: CircularProgressIndicator(
                        backgroundColor: MyTheme.whiteColor,
                        color: MyTheme.primaryColor,
                      ),
                    );
      } else if(state is ErrorState){
        return  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(state.errorMessage),
                          ElevatedButton(onPressed: (){
                           modelView.getSources(widget.cat.id);
                           setState(() {

                           });
                          }, child: const Text('Try Again'))
                        ],
                       );
      } else if (state is SuccessState){
        return TabWidget(sourceList: state.sourcesList,);
      }
      return Container();
      },);

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
