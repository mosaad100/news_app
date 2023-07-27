import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/Format_Date/FormatDate.dart';
import 'package:newss_app/HomeScreen/News_Details/NewsDetails.dart';

import '../../API/Models from Api/NewsResonse.dart';

class NewsWidget extends StatelessWidget {
  //photo + News's source + Title
  News news;

  NewsWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(NewsDetailsScreen.routeName, arguments: news);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //-----------------------------------photo---------------------------------------------
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: "${news.urlToImage}",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            //-----------------------------------author--------------------------------------------------------------------
            Text(news.author ?? "",
                style: const TextStyle(color: Color(0xFF79828B), fontSize: 12)),
            //------------------------------Title-------------------------------------------------------------------------
            Text(news.title ?? "",
                style: const TextStyle(color: Color(0xFF79828B), fontSize: 22)),
            Text(
              formatDate(news.publishedAt ?? ''),
              textAlign: TextAlign.end,
              style: const TextStyle(color: Color(0xFF79828B), fontSize: 12),
            ),
            //-------------------------------------------------------------------------------------------------------
          ],
        ),
      ),
    );
  }
}
