import 'package:classattedance/screens/getuserinfo/getuserinfopageview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserInfoDone extends StatefulWidget {
  @override
  _GetUserInfoDoneState createState() => _GetUserInfoDoneState();
}

class _GetUserInfoDoneState extends State<GetUserInfoDone> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/course.png", height: 150, width: 150,),
            SizedBox(height: 20,),
            Text("All done " + name, style: TextStyle(  fontSize: 22, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Below are your recorded information", style: TextStyle(  fontSize: 20,),),
            SizedBox(height: 10,),
            Divider(thickness: 0.5,  ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Name: ", style: TextStyle(  fontSize: 19,),),
                Text(name, style: TextStyle(  fontSize: 19, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Index Number: ", style: TextStyle(  fontSize: 19,),),
                Text(indexnumber, style: TextStyle(  fontSize: 19, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Reference Number: ", style: TextStyle(  fontSize: 19,),),
                Text(referencenumber, style: TextStyle(  fontSize: 19, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Year: ", style: TextStyle(  fontSize: 19,),),
                Text(year, style: TextStyle(  fontSize: 19, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Programme: ", style: TextStyle(  fontSize: 19,),),
                Text(programme, style: TextStyle(  fontSize: 19, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("College: ", style: TextStyle(  fontSize: 19,),),
                Text(college, style: TextStyle(  fontSize: 19, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            Divider(thickness: 0.5,  ),
            SizedBox(height: 10,),
            Text("You can make edits later in the settings", style: TextStyle(  fontSize: 15,),),
          ],
        ),
      ),
    );
  }

}
