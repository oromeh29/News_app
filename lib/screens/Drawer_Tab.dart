import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;
  DrawerTab(this.onClick);
  static int Cat_Id=1;
  static int Sett_Id=2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * .6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              height: 100,
              width: double.infinity,
              child: Center(
                child: Text("NewsApp", style:GoogleFonts.nunitoSans(color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () {
onClick(Cat_Id);
              },
              child: InkWell(
                onTap: () {
                  onClick(Sett_Id);

                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu)
                      ,Text("Categories",style: GoogleFonts.nunitoSans()),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.settings)
                  ,Text("Setting",style: GoogleFonts.nunitoSans()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
