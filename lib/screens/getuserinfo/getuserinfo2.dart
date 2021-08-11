import 'package:flutter/material.dart';

import 'getuserinfopageview.dart';

class GetUserInfo2 extends StatefulWidget {
  @override
  _GetUserInfo2State createState() => _GetUserInfo2State();
}

class _GetUserInfo2State extends State<GetUserInfo2> {




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
        child: ListView(
          children: [
            SizedBox(height: 100,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/images/user.png",height: 100, width: 100,),
                SizedBox(height: 30,),
                Text("Tell us a bit about you ...", style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    onChanged: ((value){
                      name = value;
                      print(name);
                    }),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Index Number",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    onChanged: ((value){
                      indexnumber = value;
                      print(indexnumber);
                    }),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Reference Number",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    onChanged: ((value){
                      referencenumber = value;
                      print(referencenumber);
                    }),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Year",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    onChanged: ((value){
                      year = value;
                      print(year);
                    }),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Programme",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    onChanged: ((value){
                      programme = value;
                      print(programme);
                    }),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "College",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    onChanged: ((value){
                      college = value;
                      print(college);
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
