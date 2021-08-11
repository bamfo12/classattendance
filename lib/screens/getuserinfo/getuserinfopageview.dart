import 'package:classattedance/screens/getuserinfo/getuserinfo1.dart';
import 'package:classattedance/screens/getuserinfo/getuserinfo2.dart';
import 'package:classattedance/screens/getuserinfo/getuserinfodone.dart';
import 'package:classattedance/screens/home.dart';
import 'package:classattedance/screens/splash.dart';
import 'package:classattedance/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GetUserInfoPageView extends StatefulWidget {

  int initialpage = 0;

  GetUserInfoPageView({this.initialpage});

  @override
  _GetUserInfoPageViewState createState() => _GetUserInfoPageViewState();
}

String name = "";
String indexnumber = "";
String referencenumber = "";
String year = "";
String programme = "";
String college = "";
Color buttonColor = Colors.purple;
bool doneFilling = true;


class _GetUserInfoPageViewState extends State<GetUserInfoPageView> {

  String nextText = "Next";
  PageController _controller = new PageController();

  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Stack(
            children: <Widget>[
              PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                children: <Widget>[
                  GetUserInfo1(),
                  GetUserInfo2(),
                  GetUserInfoDone()
                ],
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: (){
                    nextPage();
                  },

                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(child: Text(nextText, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }

  Future<void> nextPage() async {

    if(_controller.page == 0){
      await _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
      nextText = "Next";
      setState(() {
        buttonColor = Colors.grey;
      });
    } else if(_controller.page == 1){
      await checkField();
      if(doneFilling){
        print("Information filled");
        saveUserInformation();
        await _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
        nextText = "Done";
      }
      saveUserInformation();
      await _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
      nextText = "Done";

    } else if(_controller.page == 2){
      sharedPreferences.setBool("firsttimeuser", false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
    }

    setState(() {

    });
  }

  Future<void> saveUserInformation() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(Constants.NAME, name);
    sharedPreferences.setString(Constants.INDEXNUMBER, indexnumber);
    sharedPreferences.setString(Constants.REFERENCENUMBER, referencenumber);
    sharedPreferences.setString(Constants.YEAR, year);
    sharedPreferences.setString(Constants.PROGRAMME, programme);
    sharedPreferences.setString(Constants.COLLEGE, college);

    print(sharedPreferences.getString(Constants.NAME));
    print(sharedPreferences.getString(Constants.INDEXNUMBER));
    print(sharedPreferences.getString(Constants.REFERENCENUMBER));
    print(sharedPreferences.getString(Constants.YEAR));
    print(sharedPreferences.getString(Constants.PROGRAMME));
    print(sharedPreferences.getString(Constants.COLLEGE));

  }

   checkField(){
    if(name == null || name.trim() == ""){
      doneFilling = false;
    }  if(indexnumber == null || indexnumber.trim() == ""){
      doneFilling = false;
    } if(referencenumber == null || referencenumber.trim() == ""){
      doneFilling = false;
    }if(year == null || year.trim() == ""){
      doneFilling = false;
    }if(programme == null || programme.trim() == ""){
      doneFilling = false;
    }if(college == null || college.trim() == ""){
      doneFilling = false;
    }

    if(doneFilling){
      setState(() {
        buttonColor = Colors.purple;
      });
    }

   }


}
