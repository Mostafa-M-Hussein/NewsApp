import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget loading() {
  return Container(
    child: Center(
      child: CircularProgressIndicator() ,
    ) ,
  );
}
String dateWritten(String dateTime) {
  Duration _timeAgo = DateTime.now().difference(DateTime.parse(dateTime));
  DateTime theDifference = DateTime.now().subtract(_timeAgo);
  return timeago.format(theDifference);
}

Widget noData() {
  return Container(
    padding: EdgeInsets.all(15),
    child: Text("No Data Available ! "),
  );
}

Widget connectionError() {
  return Container(
    padding: EdgeInsets.all(15),
    child: Text("Connection Error ! "),
  );
}

Widget error(var error) {
  return Container(
    padding: EdgeInsets.all(15),
    child: Text(error),
  );
}
