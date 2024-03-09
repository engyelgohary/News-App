// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/home/catagories/tab_widget.dart';
import 'package:news/model/NewResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/mytheme.dart';

class News extends StatefulWidget {
  Source source;
  News({required this.source});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewResponse?>(
        future: ApiManger.getNewsbyId(widget.source.id??""),
         builder: (context, snapshot) {
           if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.whiteColor,
                color: MyTheme.primaryColor,
              ),
            );
           } else if(snapshot.hasError){
               return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const Text('Smothing went Wrong'),
                  ElevatedButton(onPressed: (){
                    ApiManger.getNewsbyId(widget.source.id??"");
                    setState(() {
                      
                    });
                  }, child: const Text('Try Again'))
                ],
               );
           }
           if(snapshot.data?.status !='ok'){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(snapshot.data?.message ??'Smothing went Wrong'),
                  ElevatedButton(onPressed: (){
                      ApiManger.getNewsbyId(widget.source.id??"");
                      setState(() {
                        
                      });
                  }, child: const Text('Try Again'))
                ],
               );
           }
           var newList = snapshot.data?.articles ?? [];
           return ListView.builder(itemBuilder: (context, index) {
             return Text(newList[index].title??"");
           },
           itemCount: newList.length,
           );
         },
    );
  }
}
