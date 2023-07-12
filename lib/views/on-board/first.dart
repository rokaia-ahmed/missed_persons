import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:missed_people/views/login/after_onboarding.dart';
import 'package:missed_people/views/on-board/second.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);
  static String routeName = "First";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const signIn_signUp(),
              ),
            );
          },
          child: Text('Skip',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF092E5C))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 4,
            ),
            Image.asset('assets/images/firstOnBoard.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Upload',
              style: TextStyle(fontSize: 15.75, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: AutoSizeText.rich(
                TextSpan(
                  text:
                      'Searching for some one who you missed in some where you don’t know ,just ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'UPLOAD',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF092E5C),
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                        text:
                            ' photo of him/her and let us find him/her for you',
                        style: TextStyle()),
                  ],
                ),
                style: TextStyle(
                  fontSize: 16,
                ),
                maxFontSize: 12,
              ),
            ),
            Spacer(
              flex: 4,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Second.routeName);
                  },
                  child: CircularPercentIndicator(
                    radius: 50,
                    backgroundColor: Colors.white,
                    lineWidth: 5,
                    percent: .33,
                    progressColor: Color(0xFF092E5C),
                    center: Icon(Icons.arrow_forward,
                        color: Color(0xFF092E5C), size: 35),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
