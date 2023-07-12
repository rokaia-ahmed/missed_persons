import 'dart:async';

import 'package:flutter/material.dart';
import 'package:missed_people/views/on-board/first.dart';

import '../../core/shared_preferences/shared_pref_user.dart';
import '../layout/screens/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PrefUser.getUser() != null
                    ? const LayOutScreen()
                    : const First())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              'MISSING',
              style: TextStyle(
                  color: Color(0xFF092E5C),
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              'PERSON',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          )
        ],
      ),
      // Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(image: AssetImage('assets/images/splash-screen.png'))
      //   ),
      // ),
    );
  }
}
