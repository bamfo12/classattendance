import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseInfo extends StatefulWidget {
  @override
  _CourseInfoState createState() => _CourseInfoState();
}

String coursecode;

class _CourseInfoState extends State<CourseInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
         ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Course Code",
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Course code"
            ),
            onChanged: ((value){
              coursecode = value;
            }),
          )
        ],
      ),
    );
  }
}
