import 'package:flutter/material.dart';
import 'package:newss_app/API/Api_manager.dart';
import 'package:newss_app/API/Models%20from%20Api/SoursesResponse.dart';
import 'package:newss_app/HomeScreen/News/News_Tabs.dart';

import '../Categories/Categories.dart';

class NewsFragment extends StatelessWidget {
  static const String routeName = " home ";
  Category category;

  NewsFragment(this.category);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<SourcesResponse>(
              future: ApiManger.getNewsSourses(category.id),
              builder: (buildContext, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(" ${snapshot.error.toString()}  "));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                var data = snapshot.data;
                if ("error" == data?.status) {
                  return Center(
                      child:
                          Text('  ${data?.message}')); // show me error's reason
                }
                var sources = data?.sources;
                return SourcseTabs(sources!);
              })
        ],
      ),
    );
  }
}
