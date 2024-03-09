import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/mytheme.dart';

class Category extends StatefulWidget {
  static String routeName = "Category";

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
              body: FutureBuilder<SourceResponse?>(
                future: ApiManger.getSources(),
                 builder: (context, snapshot) {
                   if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: MyTheme.primaryColor,
                      ),
                    );
                   } else if(snapshot.hasError){
                       return Center(
                         child: Column(
                          children: [
                           const Text('Smothing went Wrong'),
                            ElevatedButton(onPressed: (){
                              ApiManger.getSources();
                              setState(() {
                                
                              });
                            }, child: const Text('Try Again'))
                          ],
                         ),
                       );
                   }
                   if(snapshot.data?.status !='ok'){
                      return Column(
                        children: [
                          Text(snapshot.data?.message ??'Smothing went Wrong'),
                          ElevatedButton(onPressed: (){}, child: const Text('Try Again'))
                        ],
                       );
                   }
                   var sourceList = snapshot.data?.sources??[];
                   return ListView.builder(itemBuilder: (context, index) {
                     return Text (sourceList[index].name ?? "");
                   },
                   itemCount: sourceList.length,
                   );
                 },
                 ),
            )
      ],
    );
  }
}
