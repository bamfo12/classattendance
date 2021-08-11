import 'package:classattedance/screens/attendancelog/attendacelogdetails.dart';
import 'package:classattedance/util/crudobj.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../splash.dart';

class GenerateReport extends StatefulWidget {
  @override
  _GenerateReportState createState() => _GenerateReportState();
}

class _GenerateReportState extends State<GenerateReport> {

  QuerySnapshot postmethods;
  CRUDMethods crudObj = new CRUDMethods();
  SharedPreferences sharedPreferences;
  String selectedDate = "all";
  String logDate;
  double loadingHeight = 0;
  String coursecode;

  @override
  void initState() {
    //getLog();
    todaysDate();
    super.initState();
  }

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
                      "Generate Report",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter course code to generate report. Eg. CSM 357"),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Course code"
                      ),
                      onChanged: ((value){
                        coursecode = value;
                      }),
                    ),
                    SizedBox(height: 20,),

                    GestureDetector(
                      onTap: (){
                        getLog();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green,
                        ),
                        child: Text(
                          "Generate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
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
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Calendar(
                  isExpandable: true,
                  showCalendarPickerIcon: true,
                  onDateSelected: (value) {
                    // print(value);
                    var list = value.toString().split(" ");
                    print(list[0]);
                    selectedDate = list[0];
                    getLog();
                  },
                ),
              ),
              SizedBox(
                height: 0,
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
                height: 20,
              ),
              AnimatedContainer(
                height: loadingHeight,
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      RefreshProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Loading..."),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  itemCount:
                  postmethods == null ? 0 : postmethods.documents.length,
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext c) =>
                                    AttendanceLogDetails(
                                      name:
                                      postmethods.documents[i].data["name"],
                                      college: postmethods
                                          .documents[i].data["college"],
                                      programme: postmethods
                                          .documents[i].data["programme"],
                                      year:
                                      postmethods.documents[i].data["year"],
                                      coursecode: postmethods
                                          .documents[i].data["coursecode"],
                                      indexnumber: postmethods
                                          .documents[i].data["indexnumber"],
                                      referencenumber: postmethods
                                          .documents[i].data["referencenumber"],
                                      time:
                                      postmethods.documents[i].data["time"],
                                    )));
                      },
                      child: Visibility(
                        visible: postmethods.documents[i].data["coursecode"] == coursecode ? true : false,
                        child: new Container(
                          margin:
                          EdgeInsets.only(left: 15, right: 15, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  postmethods.documents[i].data['name'],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  postmethods.documents[i].data['coursecode'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  postmethods.documents[i].data['time']
                                      .toString(),
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void todaysDate() {
    selectedDate = DateTime.now().toString().split(" ")[0];
    print(selectedDate);
  }

  void getLog() {
    setState(() {
      postmethods = null;
      loadingHeight = 120;
    });
    Firestore.instance.collection('users/report/' + coursecode)
        .getDocuments()
        .then((results) {
      setState(() {
        postmethods = results;
        loadingHeight = 0;
      });
    });
  }
}