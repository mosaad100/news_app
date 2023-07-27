import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/API/Models%20from%20Api/NewsResonse.dart';
import 'package:newss_app/Format_Date/FormatDate.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'detailsScreen';

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var news = ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //---photo----
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
              //---author-------
              Text(news.author ?? "",
                  style:
                      const TextStyle(color: Color(0xFF79828B), fontSize: 12)),
              //------Title-----------
              Text(news.title ?? "",
                  style:
                      const TextStyle(color: Color(0xFF79828B), fontSize: 22)),
              //------date--------------
              Text(
                formatDate(news.publishedAt ?? ''),
                textAlign: TextAlign.end,
                style: const TextStyle(color: Color(0xFF79828B), fontSize: 12),
              ),
              //-----------News content ------------------
              SizedBox(height: screenHeight * 0.05),
              Text(
                news.content ?? "no news here",
                style: TextStyle(fontSize: 30),
              ),
              //------button at end of screen-----------------------
              SizedBox(height: screenHeight * 0.14),
              TextButton(
                  onPressed: () {
                    openUrl(news.url ?? "");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'View full Article ',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_circle_right_rounded,
                        size: 30,
                        color: Colors.black,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  openUrl(String? url) async {
    if (url == null) {
      return;
    }
    // we must convert url(String) ==> Uri by using parse which take from us String
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
