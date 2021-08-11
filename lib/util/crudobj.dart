import 'dart:async';

import 'package:classattedance/screens/getuserinfo/getuserinfopageview.dart';
import 'package:classattedance/util/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CRUDMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  FirebaseUser user;
  SharedPreferences sharedPreferences;
  String _indexnumber;
  String _referenceNumber;


  Future<void> addCheckinData(postData) async {
    getIndexNumber();
      Firestore.instance.collection('users/checkin/' + _indexnumber + _referenceNumber).add(postData).catchError((e) {
         print(e);
       });

  }

  Future<void> addReport(postData, String coursecode) async {
    getIndexNumber();
    Firestore.instance.collection('users/report/' + coursecode).add(postData).catchError((e) {
      print(e);
    });

  }

  getCheckinData() async {
    return await Firestore.instance.collection('checkins').getDocuments();
  }




  getIndexNumber() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString(Constants.INDEXNUMBER) != null){
      _indexnumber = sharedPreferences.getString(Constants.INDEXNUMBER);
      _referenceNumber = sharedPreferences.getString(Constants.REFERENCENUMBER);
      return sharedPreferences.getString(Constants.INDEXNUMBER).toString();
    } else{
      print("000000");
      _indexnumber = '000000';
    }
  }

}