import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newss_app/HomeScreen/Categories/Categories.dart';
import 'package:newss_app/HomeScreen/News/NewsFragment.dart';
import 'package:newss_app/HomeScreen/settings/settings.dart';

import '../API/Api_manager.dart';
import '../API/Models from Api/NewsResonse.dart';
import '../my functions/Ui_Utils.dart';
import 'News/News_Widget.dart';
import 'SideMenu.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/back.jpg',
              ),
              fit: BoxFit.fill),
          color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          )),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: NewsSearch());
              },
              icon: Lottie.asset(
                "assets/search2.json",
              ),
            )
          ],
          title: const Text('News App'),
        ),
        drawer: Drawer(
          child: HomeSideMenu(onSideMenuItemClick),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: currentWidget,
            )),
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    currentWidget = Categories(onCategoryClick);
  }

  late Widget currentWidget = Categories(onCategoryClick);

  void onCategoryClick(Category category) {
    currentWidget = NewsFragment(category);
    setState(() {});
  }

  void onSideMenuItemClick(int type) {
    if (type == HomeSideMenu.CATEGORIES) {
      currentWidget = Categories(onCategoryClick);
    } else if (type == HomeSideMenu.SETTING) {
      currentWidget = Settings();
    }
    Navigator.pop(context);
    setState(() {});
  }
}

//-Class to Extend the class of search-
class NewsSearch extends SearchDelegate {
  // extend to let me search
  /// List<String> _oldFilters =  [];
  @override // when i click on icon what will be happen
  List<Widget>? buildActions(BuildContext context) {
    // (1)
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            size: 35,
          )),
    ];
  }

  //Leading
  @override //at the first part
  Widget? buildLeading(BuildContext context) {
    //(2)
    return IconButton(
        onPressed: () {
          hideLoading(context);
        },
        icon: Icon(
          Icons.clear,
          size: 35,
          color: Colors.red,
        ));
  }

  //-the results

  @override
  Widget buildResults(BuildContext context) {
    //(3)
    return FutureBuilder<NewsResponse>(
      future: ApiManger.getNews(searchKeyword: query),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error.toString()}  "));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            )),
          );
        }
        var data = snapshot.data; // we get data
        if ("error" == data?.status) {
          return Center(child: Text('  ${data?.message}'));
        } //check if the server send error  if no so ...
        return Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Container(
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.brown))),
                  child: NewsWidget((data?.newsList![index])!));
            },
            itemCount: data?.newsList!.length,
          ),
        );
      },
    );
  }

  //-------Suggestions-----
  @override
  Widget buildSuggestions(BuildContext context) {
    //(4)
    return Center(
        child: Image.asset(
      'assets/search.gif',
      fit: BoxFit.fill,
    ));
  }
}
