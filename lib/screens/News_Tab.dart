import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/cubit/cubit.dart';
import 'package:news_app/Layout/cubit/states.dart';
import 'package:news_app/screens/tab_controller.dart';

class NewsTab extends StatelessWidget {
  String catid;

  NewsTab(this.catid);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSources(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState || state is HomeGetNewsLoadingState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is HomeGetSourcesSuccessState || state is HomeChangeSourceState) {
            HomeCubit.get(context).getNewsData();
          }else if (state is HomeGetNewsSuccessState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is HomeGetSourcesLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return TabControllerWidget(HomeCubit.get(context).sources);
        },
      ),
    );
  }
}
