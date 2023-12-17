import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';

class SourceItem extends StatelessWidget {
  Sources sources;
  bool Selected;


  SourceItem(this.sources, this.Selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      decoration: BoxDecoration(
        color: Selected?Colors.green:Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.green),
      ),
      child: Text(sources.name??"",style: TextStyle(
        color:  Selected?Colors.white:Colors.green,
      )),
    );
  }
}
