import 'dart:async';

import 'package:classattedance/screens/attendancelog/attendancelog.dart';
import 'package:classattedance/screens/splash.dart';
import 'package:classattedance/util/constants.dart';
import 'package:classattedance/util/crudobj.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'attendancelog/attendacelogdetails.dart';
import 'checkin/checkin.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _error;
  Position _currentPosition;
  String _currentAddress = "Getting location";
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  SharedPreferences sharedPreferences;
  String name = "";
  String indexnumber = "";
  String referencenumber = "";
  String year = "";
  String programme = "";
  String college = "";
  double iconHeight = 300;
  QuerySnapshot postmethods;
  CRUDMethods crudObj = new CRUDMethods();


  @override
  void initState() {
    _getCurrentLocation();
    getUserInfo();
    Timer(Duration(seconds: 4), () {
      setState(() {
        iconHeight = 60;
      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.ease,
                    height: iconHeight,
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
                    "Student",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AttendanceLog()));
                        },
                        child: Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/quiz.png",
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.yellow.withOpacity(0.9),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 0,
                                    ),
                                    Image.asset(
                                      "assets/images/quiz.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Attendance log",
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
                      Column(
                        children: [
                          Container(
                            height: 85,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20))),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/location.png",
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.9),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Image.asset(
                                            "assets/images/location.png",
                                            height: 25,
                                            width: 25,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            if (_currentPosition != null)
                                              Text(
                                                _currentAddress,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 85,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/user.png",
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.9),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Image.asset(
                                            "assets/images/user.png",
                                            height: 25,
                                            width: 25,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              subindexnumber,
                                              style:
                                                  TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CheckIn()));
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
                                  "Check in to class",
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
              SizedBox(height: 20,),
              Row(
                children: [
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
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Attendance Log"),
                  Spacer(),
                  GestureDetector(child: Text("See all"), onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext c) => AttendanceLog()));
                  },)
                ],
              ),
              SizedBox(height: 20,),
              ListView.builder(
                  itemCount: postmethods == null ? 1 : 5,
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, i) {
                    return postmethods == null ? Center(
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
                    ) : GestureDetector(
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
                      child: new Container(
                        margin:
                        EdgeInsets.only(left: 0, right: 0, bottom: 10),
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
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 0,
                              ),
                              Text(
                                postmethods.documents[i].data['coursecode'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                postmethods.documents[i].data['time'].toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                            ],
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

  _getCurrentLocation() async {
   await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.name}, ${place.locality}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    name = sharedPreferences.getString(Constants.NAME);
    Firestore.instance
        .collection('users/checkin/' + subindexnumber+subreferencenumber)
        .getDocuments()
        .then((results) {
      setState(() {
        postmethods = results;
      });
    });
    setState(() {});
  }
}
