import 'package:flutter/material.dart';
import 'package:news_app/Layout/cubit/cubit.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/screens/news_Card_Item.dart';
import 'package:news_app/screens/source_Item.dart';

class TabControllerWidget extends StatelessWidget {
  List<Sources> sources;

  TabControllerWidget(this.sources);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: HomeCubit.get(context).sources.length,
          child: TabBar(
            onTap: (index) {
              HomeCubit.get(context).changeSource(index);

            },
            indicatorColor: Colors.transparent,
            isScrollable: true,
            tabs: HomeCubit.get(context).sources
                .map((source) => Tab(
                    child: SourceItem(
                        source,
                        HomeCubit.get(context).sources.indexOf(source) ==
                            HomeCubit.get(context).selectedIndex)))
                .toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsCard(HomeCubit.get(context).articles[index]);
            },
            itemCount: HomeCubit.get(context).articles.length,
          ),
        ),
      ],
    );
  }
}
