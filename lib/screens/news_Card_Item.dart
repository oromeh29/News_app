import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/NewsResponse.dart';

class NewsCard extends StatelessWidget {
  Articles articles;

  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.transparent)),
      elevation: 12,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14)),
              child:
              CachedNetworkImage(
                imageUrl:   articles.urlToImage ?? "",
              fit: BoxFit.cover, height: 230,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),),

          Text(
            articles.title ?? "",
            style: GoogleFonts.notoSans(
              textStyle: TextStyle(

                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
            ,maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              articles.description ?? "",
             style: GoogleFonts.notoSans(
                textStyle: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              )
              ,maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                articles.author ?? "",overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                )
              ),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(articles.publishedAt?.substring(0, 10) ?? "",style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
