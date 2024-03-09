// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news/home/catagories/tab_item.dart';
import 'package:news/model/SourceResponse.dart';

class  TabWidget extends StatefulWidget {
    List<Source> sourceList ;

TabWidget({required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
    int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
       child: Column(
        children: [
            TabBar(
              onTap: (index){
                selectedindex = index;
                setState(() {
                  
                });
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sourceList.map((source) => Tabitem(isSelected: selectedindex == widget.sourceList.indexOf(source), source:source )).toList()
              )
       ],));
  }
}