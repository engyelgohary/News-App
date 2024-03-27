// ignore_for_file: use_key_in_widget_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/model/NewResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/theme/mytheme.dart';

import 'news_detials.dart';

class News_item extends StatelessWidget {
  News news;
  News_item({required this.news});

  DateFormat dateFormat = DateFormat('dd-MM-yyyy (HH:mm)');
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsNews(news: news)),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              height: MediaQuery.sizeOf(context).height*.3,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  backgroundColor: MyTheme.whiteColor,
                  color: MyTheme.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) =>  Icon(Icons.error,size: 40,color:MyTheme.primaryColor,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              news.author ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.grayColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              news.title ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              news.publishedAt!= null ? dateFormat.format(DateTime.parse(news.publishedAt!)) : "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.grayColor),
                  textAlign: TextAlign.end,
            ),
          ),
        ]),
      ),
    );
  }
}
