import 'package:flutter/material.dart';
import 'package:newss_app/HomeScreen/News/News_List.dart';
import 'package:newss_app/HomeScreen/News/SourceTab.dart';

import '../../API/Models from Api/SoursesResponse.dart';

//                            to create the tabs and determine which one is selected
class SourcseTabs extends StatefulWidget {
  List<Source> sources;

  SourcseTabs(this.sources);

  @override
  State<SourcseTabs> createState() => _SourcseTabsState();
}

class _SourcseTabsState extends State<SourcseTabs> {
  int selectedtab = 0; //by default it select the first one

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        // widget which create tabs
        length: widget.sources.length, //length of my list
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedtab =
                      index; // ta first we will make index == 0 when we click on the tabs
                  setState(() {});
                },
                indicatorColor: Colors.transparent, //the line under the tabs
                isScrollable: true,
                tabs: widget.sources.map((source) {
                  var iselected = widget.sources.indexOf(source) == selectedtab;
                  // we checked that the index of the tab we chosen

                  return SourceTab(source, iselected);
                }).toList()),
            NewsList(widget.sources[selectedtab])
          ],
        ),
      ),
    );
  }
}
