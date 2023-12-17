import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:news_app/Layout/cubit/states.dart';
import 'package:news_app/Shared/Components/constant.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourcesResponse.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Sources> sources = [];
  List<Articles> articles = [];
  int selectedIndex = 0;

  void changeSource(int value) {
    emit(HomeInitState());
    selectedIndex = value;
    emit(HomeChangeSourceState());
  }

  Future<void> getSources() async {
    emit(HomeGetSourcesLoadingState());
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "dc491befdec545f2b6320ecec034c404"});
    Response response = await http.get(url);
    try {
      var jsonData = jsonDecode(response.body); //to convert to json object
      SourcesResponse data = SourcesResponse.fromJson(jsonData);
      sources = data.sources ?? [];
      emit(HomeGetSourcesSuccessState());
    } catch (e) {
      emit(HomeGetSourcesErrorState());
      throw e;
    }
  }

  Future<void> getNewsData() async {
    emit(HomeGetNewsLoadingState());
    Uri url = Uri.https(Base_Url, "/v2/everything",
        {"apiKey": Api_Key, "sources": sources[selectedIndex].id});

    http.Response response = await http.get(url);
    try {
      var jsonData = jsonDecode(response.body);
      NewsResponse newsResponse = NewsResponse.fromJson(jsonData);
      articles = newsResponse.articles ?? [];
      emit(HomeGetNewsSuccessState());
    } catch (e) {
      emit(HomeGetNewsErrorState());
      throw e;
    }
  }
}
