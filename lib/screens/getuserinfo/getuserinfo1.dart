import 'package:flutter/material.dart';

class GetUserInfo1 extends StatefulWidget {
  @override
  _GetUserInfo1State createState() => _GetUserInfo1State();
}

class _GetUserInfo1State extends State<GetUserInfo1> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/list.png" , height: 100, width: 100,),
              SizedBox(height: 20,),
              Text("Class Attendance", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("Check in to every class you attend", style: TextStyle( fontSize: 18),),
              SizedBox(height: 0,),
              Text("Let\'s get started", style: TextStyle(fontSize: 18),),
              SizedBox(height: 30,),

            ],
          ),
        )
      ),
    );
  }
}
