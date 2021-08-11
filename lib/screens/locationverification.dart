import 'package:classattedance/screens/biometricsverification.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class LocationVerification extends StatefulWidget {
  @override
  _LocationVerificationState createState() => _LocationVerificationState();
}

class _LocationVerificationState extends State<LocationVerification> {
  String _error;
  Position _currentPosition;
  String _currentAddress = "Getting location";
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  bool proceedBool = false;
  bool loading = true;
  String verifiedText = "";

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                  height: 70,
                  child: Image.asset(
                    "assets/images/location.png",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: loading,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: LinearProgressIndicator(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _currentAddress,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(verifiedText),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) => BiometricsVerification()));
                  },
                  child: Visibility(
                    visible: proceedBool,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: Text(
                        "Proceed",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
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
        print(_currentPosition);
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
        print(_currentAddress + place.administrativeArea + place.postalCode);
      });

      if (_currentAddress.contains("P. V. Obeng Avenue")) {
        proceed();
      } else{
        _currentAddress = "Location not verified";
        loading = false;
        setState(() {

        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _currentAddress =
            "Could not get your location.\nPlease make sure your location is turned on";
      });
    }
  }

  void proceed() {
    proceedBool = true;
    loading = false;
    verifiedText = "Location Verified";
    setState(() {

    });
  }
}
