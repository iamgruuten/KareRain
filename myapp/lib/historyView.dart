import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HistoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryView();
  }
}

class _HistoryView extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              children: <Widget>[Text('Past History')],
            )
          ]),
    );
  }
}
