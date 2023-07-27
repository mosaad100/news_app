import 'package:flutter/material.dart';
import 'package:newss_app/my%20functions/Ui_Utils.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Center(
              child: Text(
            'Language',
            style: TextStyle(color: Colors.green, fontSize: 29),
          )),
          InkWell(
            onTap: () {
              showMessage(context, "only English is available now ",
                  posActionName: "ok");
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "English",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 35,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
          Center(
              child: Text(
            'Themes',
            style: TextStyle(color: Colors.green, fontSize: 29),
          )),
          InkWell(
            onTap: () {
              showMessage(context, " Dark Coming Soon ", posActionName: "Ok");
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Light Theme",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 35,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
