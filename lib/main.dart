import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/Home_Layout.dart';
import 'package:news_app/observer.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
 initialRoute: HomeLayout.routeName,
      routes: {
HomeLayout.routeName:(context) => HomeLayout(),
      },
    );
  }
}
