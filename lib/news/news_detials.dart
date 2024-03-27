import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import '../model/NewResponse.dart';
import '../theme/mytheme.dart';
import 'package:intl/intl.dart';



class DetailsNews extends StatelessWidget {

  News news;

  DetailsNews({super.key, required this.news});

  DateFormat dateFormat = DateFormat('dd-MM-yyyy (HH:mm)');

  @override
  Widget build(BuildContext context) {
    return

      Stack(
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
              title: Text(news.author ?? "",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: news.urlToImage ?? '',
                          width: double.infinity,
                          fit: BoxFit.fill,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.3,
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    news.author ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: MyTheme.grayColor),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    news.title ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    news.publishedAt != null ? dateFormat.format(
                        DateTime.parse(news.publishedAt!)) : "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.grayColor),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 25,),
                  Text(
                    news.description ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: MyTheme.blackColor),
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          final url = news.url;
                          if (url != null && await canLaunch(url)) {
                            await launch(url);
                          } else {
                          }
                        },
                        child: Text(
                          'View Full Article',
                          style: TextStyle(
                            fontSize: 14,
                            color: MyTheme.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_right_sharp, size: 40,
                        color: MyTheme.primaryColor,)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }

  void openUrl(String url) async {
    try {
      await Process.run('cmd', ['/c', 'start', url]);
    } catch (e) {
      print('Error: $e');
    }
  }
}

// void openUrl(String url) async {
//   try {
//     await Process.run('cmd', ['/c', 'start', url]);
//   } catch (e) {
//     print('Error: $e');
//   }
// }