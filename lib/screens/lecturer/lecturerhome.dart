import 'package:classattedance/screens/checkin/checkin.dart';
import 'package:classattedance/screens/lecturer/generatereport.dart';
import 'package:flutter/material.dart';

class LecturerHome extends StatefulWidget {
  @override
  _LecturerHomeState createState() => _LecturerHomeState();
}

class _LecturerHomeState extends State<LecturerHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.ease,
                      height: 50,
                      child: Image.asset(
                        "assets/images/course.png",
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(
                          "Class Attendance",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "Lecturer",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => GenerateReport()));
                      },
                      child: Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/images/list.png",
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.yellow.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(20)),
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Image.asset(
                                    "assets/images/list.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Generate Report",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
