import 'package:flutter/material.dart';
import 'package:newss_app/API/Api_manager.dart';
import 'package:newss_app/API/Models%20from%20Api/NewsResonse.dart';
import 'package:newss_app/API/Models%20from%20Api/SoursesResponse.dart';

import 'News_Widget.dart';

//                             test if there's error
//
class NewsList extends StatefulWidget {
  Source source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<News> news = [];

  int pagenumber = 1;

  bool shouldloadnextpage = false;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool istop = scrollController.position.pixels == 0;
        if (!istop) {
          shouldloadnextpage = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  //-------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    if (shouldloadnextpage) {
      ApiManger.getNews(sourceId: widget.source.id ?? "", page: ++pagenumber)
          .then((newsResponse) {
        news.addAll(newsResponse.newsList ?? []);
        shouldloadnextpage = false;
        setState(() {});
      });
    }

    return Expanded(
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
            future: ApiManger.getNews(sourceId: widget.source.id ?? ""),
            builder: (buildContext, snapShot) {
              if (snapShot.hasError) {
                return Center(child: Text('${snapShot.error.toString()}'));
              } else if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapShot.data;
              if ('error' == data?.status) {
                // we got code and message from server
                return Center(child: Text('${data?.message}'));
              }
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return NewsWidget((data?.newsList![index])!);
                  },
                  itemCount: data?.newsList?.length ?? 0,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
