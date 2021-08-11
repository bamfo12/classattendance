import 'package:classattedance/screens/lecturer/lecturerhome.dart';
import 'package:classattedance/screens/locationverification.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginType extends StatefulWidget {
  @override
  _LoginTypeState createState() => _LoginTypeState();
}

class _LoginTypeState extends State<LoginType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.ease,
                    height: 70,
                    child: Image.asset(
                      "assets/images/course.png",
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Select your log in type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LocationVerification()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20)),
                      width: double.infinity,

                      child: Center(child: Text("Student", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                    ),
                  ),

                  SizedBox(height:10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LecturerHome()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20)),
                      width: double.infinity,

                      child: Center(child: Text("Lecturer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
