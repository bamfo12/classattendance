import 'package:classattedance/screens/splash.dart';
import 'package:classattedance/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubProfile extends StatefulWidget {
  @override
  _SubProfileState createState() => _SubProfileState();
}


class _SubProfileState extends State<SubProfile> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Name",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subname,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 0.5,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Index Number",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subindexnumber,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 0.5,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Reference Number",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subreferencenumber,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }


}
