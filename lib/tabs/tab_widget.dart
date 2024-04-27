// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news/tabs/tab_item.dart';
import 'package:news/news/news_widget.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:provider/provider.dart';

import '../news/news_widget_view_Model.dart';

class  TabWidget extends StatefulWidget {
    List<Source> sourceList ;

    TabWidget({required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  NewsDetailsViewModel viewModel = NewsDetailsViewModel();
  int selectedindex = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.sourceList[selectedindex].id!);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsDetailsViewModel>(
        builder: (context, value, child) {
          return DefaultTabController(
              length: widget.sourceList.length,
              child: Column(
                children: [
                  TabBar(
                      onTap: (index){
                        setState(() {
                          selectedindex = index;
                          viewModel.getNews(widget.sourceList[selectedindex].id!);
                        });
                      },
                      indicatorColor: Colors.transparent,
                      isScrollable: true,
                      tabs: widget.sourceList.map((source) => Tabitem(isSelected: selectedindex == widget.sourceList.indexOf(source), source:source )).toList()
                  ),
                  Expanded(child: News_details(source: widget.sourceList[selectedindex]))
                ],));
        },
      ),
    );
  }
}