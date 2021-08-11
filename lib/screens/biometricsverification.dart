import 'dart:io';

import 'package:classattedance/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class BiometricsVerification extends StatefulWidget {
  @override
  _BiometricsVerificationState createState() => _BiometricsVerificationState();
}

class _BiometricsVerificationState extends State<BiometricsVerification> {
  bool _canCheckBiometrics;
  bool canCheckBiometrics;
  LocalAuthentication localAuthentication;
  List<BiometricType> availableBiometrics;
  List<BiometricType> _availableBiometrics;
  bool authenticated = false;
  String _authorized = "Verify your identify using biometrics";
  String buttonText = "Click to authenticate";
  @override
  void initState() {
    init();
    hasBiometrics();
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
                    "assets/images/fingerprint.png",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _authorized,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(availableBiometrics.toString().contains("fingerprint")
                    ? "Fingerprint available"
                    : "No Authentication method available"),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if(authenticated){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) => Home()));
                    } else{
                      authenticate();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                    child: Text(
                      authenticated ? "Proceed" : "Click to authenticate",
                      style: TextStyle(color: Colors.white),
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

  Future<void> init() async {
    localAuthentication = LocalAuthentication();

    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        // Face ID.
        print("Fingerprint available");
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        // Touch ID.
        print("Face ID");
      }
    }
  }

  Future<void> getAvailableBiometrics() async {
    try {
      availableBiometrics = await localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });

    print(availableBiometrics);

    //authenticate();
  }

  Future<void> authenticate() async {
    try {
      authenticated = await localAuthentication.authenticateWithBiometrics(
        localizedReason: "Verify your identity using your biometrics",
        stickyAuth: false,
        useErrorDialogs: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _authorized =
          authenticated ? "Identity verified" : "Identity Not Verified";

    });
  }

  Future<void> hasBiometrics() async {
    try {
      canCheckBiometrics = await localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });

    getAvailableBiometrics();
  }
}
