import 'package:flutter/material.dart';
import 'package:newss_app/API/Models%20from%20Api/SoursesResponse.dart';

//                                shape of all tabs
class SourceTab extends StatefulWidget {
  Source source; // get all variables from source
  bool selected; //to show the selected or not
  SourceTab(this.source, this.selected);

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13.0),
      margin: const EdgeInsets.all(5.0),
      // -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  -- -- -- -- -- -- -- -- -- -- --
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.selected
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor)),
      // -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  -- -- -- -- -- -- -- -- -- -- --
      child: Text(
        widget.source.name ?? "",
        style: TextStyle(
            color: widget.selected
                ? Colors.white
                : Theme.of(context).primaryColor),
      ),
    );
  }
}
