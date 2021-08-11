import 'dart:async';

import 'package:classattedance/screens/getuserinfo/getuserinfopageview.dart';
import 'package:classattedance/screens/home.dart';
import 'package:classattedance/screens/logintype.dart';
import 'package:classattedance/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
SharedPreferences sharedPreferences;
String subname = "...";
String subindexnumber = "...";
String subreferencenumber = "...";
String subyear = "...";
String subprogramme = "...";
String subcollege = "...";
bool darkMode = true;


class _SplashState extends State<Splash> {
  bool firsttime = true;
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      getUserInfo();
      checkUser();
      checkDarkMode();

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Image.asset("assets/images/list.png", height: 200, width: 200,)
          )),
    );
  }

  Future<void> checkUser() async {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginType()));

//    sharedPreferences = await SharedPreferences.getInstance();
//
//    if(sharedPreferences.getBool("firsttimeuser") == null){
//      firsttime = true;
//    } else{
//      firsttime = sharedPreferences.getBool("firsttimeuser");
//    }
//
//    print(firsttime);
//    if(firsttime){
//      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => GetUserInfoPageView()));
//    } else if(!firsttime){
//      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
//    }
  }

  Future<void> getUserInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();

    subindexnumber = sharedPreferences.getString(Constants.INDEXNUMBER);
    subreferencenumber = sharedPreferences.getString(Constants.REFERENCENUMBER);
    subname = sharedPreferences.getString(Constants.NAME);
    subyear = sharedPreferences.getString(Constants.YEAR);
    subprogramme = sharedPreferences.getString(Constants.PROGRAMME);
    subcollege = sharedPreferences.getString(Constants.COLLEGE);
    print('User Information');
    print(sharedPreferences.getString(Constants.NAME));
    print(sharedPreferences.getString(Constants.INDEXNUMBER));
    print(sharedPreferences.getString(Constants.REFERENCENUMBER));
    print(sharedPreferences.getString(Constants.YEAR));
    print(sharedPreferences.getString(Constants.PROGRAMME));
    print(sharedPreferences.getString(Constants.COLLEGE));

    setState(() {

    });
  }

  void checkDarkMode() {
    print(WidgetsBinding.instance.window.platformBrightness);

    if (WidgetsBinding.instance.window.platformBrightness == Brightness.dark) {
      darkMode = true;
    } else if (WidgetsBinding.instance.window.platformBrightness ==
        Brightness.light) {
      darkMode = false;
    }
  }


}
