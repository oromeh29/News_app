import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/Category_Model.dart';
import 'package:news_app/screens/cateogry_item.dart';

class CateogoriesScreen extends StatelessWidget {
  List<CategoryModel> category;
  Function onclick;

  CateogoriesScreen(this.category, this.onclick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pick your category of interest",
              style: GoogleFonts.nunitoSans(fontSize: 19)),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
              children: category
                  .map((cat) => InkWell(
                      onTap: () {
                        onclick(cat);
                      },
                      child: CategoryItem(cat)))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
