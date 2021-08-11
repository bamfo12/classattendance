import 'dart:io';

import 'package:classattedance/screens/checkin/camerapreview.dart';
import 'package:classattedance/screens/checkin/courseinfo.dart';
import 'package:classattedance/screens/checkin/subprofile.dart';
import 'package:classattedance/screens/getuserinfo/getuserinfo2.dart';
import 'package:classattedance/screens/getuserinfo/getuserinfopageview.dart';
import 'package:classattedance/screens/home.dart';
import 'package:classattedance/util/constants.dart';
import 'package:classattedance/util/crudobj.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../splash.dart';

class CheckIn extends StatefulWidget {
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  CRUDMethods crudObj;

  File _image;
  String _uploadedFileURL = "null";
  String buttonText = "Check in";

  @override
  void initState() {
    super.initState();
    crudObj = new CRUDMethods();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
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
                            "Check In",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
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
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SubProfile(),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    GetUserInfoPageView()));
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Course Info",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CourseInfo(),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 300,
                          child: RaisedButton(
                            onPressed: () => getImage(ImgSource.Camera),
                            color: Colors.deepPurple,
                            child: Text(
                              "Click for facial verification".toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        _image != null ? Image.file(_image) : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () {
                        uploadPost();
                      },
                      color: Colors.green,
                      child: Text(
                        buttonText,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void uploadPost() {
    String datetime = DateTime.now().toString();

    crudObj.addCheckinData({
      'referencenumber': subreferencenumber,
      'name': subname,
      'indexnumber': subindexnumber,
      'coursecode': coursecode,
      'year': subyear,
      'programme': subprogramme,
      'college': subcollege,
      'time': datetime
    }).then((result) {
      crudObj.addReport({
        'referencenumber': subreferencenumber,
        'name': subname,
        'indexnumber': subindexnumber,
        'coursecode': coursecode,
        'year': subyear,
        'programme': subprogramme,
        'college': subcollege,
        'time': datetime
      }, coursecode).then((result) {
        setState(() {
          buttonText = "Uploaded";
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext c) => Home()));
//      if (_image != null) {
//        uploadFile();
//      }
        setState(() {});
      }).catchError((e) {
        print("--------------------");
        print("Error Uploading");
        print(e);
        print("--------------------");
      });
      setState(() {
        buttonText = "Uploaded";
      });
//      if (_image != null) {
//        uploadFile();
//      }
      setState(() {});
    }).catchError((e) {
      print("--------------------");
      print("Error Uploading");
      print(e);
      print("--------------------");
    });
  }

  Future getImage(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(
        Icons.add,
        color: Colors.red,
      ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
    );
    setState(() {
      _image = image;
    });
  }

  Future uploadFile() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('users/' + indexnumber);
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    await storageReference.getDownloadURL().then((fileURL) {
      print(fileURL);
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });

    Firestore.instance
        .collection('checkins')
        .document(indexnumber)
        .updateData({
          "photo": _uploadedFileURL,
        })
        .then((result) async => {print('photo saved')})
        .catchError((err) => print(err));
  }
}
