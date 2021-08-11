import 'package:flutter/material.dart';

import '../splash.dart';

class AttendanceLogDetails extends StatefulWidget {
  String name;
  String programme;
  String college;
  String coursecode;
  String indexnumber;
  String referencenumber;
  String time;
  String year;

  AttendanceLogDetails(
      {this.college,
      this.programme,
      this.year,
      this.referencenumber,
      this.indexnumber,
      this.name,
      this.coursecode,
      this.time});

  @override
  _AttendanceLogDetailsState createState() => _AttendanceLogDetailsState();
}

class _AttendanceLogDetailsState extends State<AttendanceLogDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: AnimatedContainer(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    duration: Duration(milliseconds: 200),
                    curve: Curves.ease,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Details",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: darkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Name"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.verified_user,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Index Number"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          widget.indexnumber,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.account_box,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Reference Number"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          widget.referencenumber,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Programme"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          widget.programme,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.account_balance,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("College"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          widget.college,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Year"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          widget.year,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.code,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Course Code"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          widget.coursecode,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Time"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          widget.time.split(".")[0],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
