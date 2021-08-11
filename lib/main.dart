import 'package:classattedance/screens/home.dart';
import 'package:classattedance/screens/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // additional settings go here
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Splash(),
      ),
//      floatingActionButton: FloatingActionButton(
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),
    );
  }
}
