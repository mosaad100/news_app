import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeSideMenu extends StatelessWidget {
  static const int SETTING = 1;

  static const int CATEGORIES = 2;

  Function onItemClickcallback;

  HomeSideMenu(this.onItemClickcallback);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Text('Side menu',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold))),
        InkWell(
          onTap: () {
            onItemClickcallback(CATEGORIES);
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: (Lottie.asset("assets/list.json", width: 50)),
              ),
              Text(
                'Categories',
                style: TextStyle(
                    color: Color(0xff303030),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            onItemClickcallback(SETTING);
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.settings,
                  size: 48,
                ),
              ),
              Text(
                'Setting',
                style: TextStyle(
                    color: Color(0xff303030),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
