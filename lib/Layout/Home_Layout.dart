import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/Category_Model.dart';
import 'package:news_app/screens/Cateogories_Screen.dart';
import 'package:news_app/screens/Drawer_Tab.dart';
import 'package:news_app/screens/News_Tab.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> category = CategoryModel.get();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer:  DrawerTab(OnDrawerClicked),
        appBar: AppBar(
          backgroundColor: Colors.green,
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              borderSide: BorderSide(color: Colors.transparent)),
          title:  Text("News",style: GoogleFonts.nunitoSans()),
        ),
        body:categoryModel==null?CateogoriesScreen(category, OnCategoryClicked):NewsTab(categoryModel!.id),
      ),
    );
  }

  CategoryModel? categoryModel = null;

  OnCategoryClicked(category) {
    categoryModel = category;
    setState(() {});
  }
  OnDrawerClicked(id){
    if(id ==DrawerTab.Cat_Id){
categoryModel=null;
    }else if(id ==DrawerTab.Sett_Id){
      categoryModel=null;
    }
    setState(() {
      Navigator.pop(context);
    });


  }
}
