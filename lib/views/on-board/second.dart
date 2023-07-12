import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:missed_people/views/on-board/third.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../login/after_onboarding.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);
  static String routeName = "Second";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            Image.asset('assets/images/secondOnBoard.png.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Text(
              'AI ANALYZING',
              style: TextStyle(fontSize: 15.75, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * .02),
              child: AutoSizeText.rich(
                TextSpan(
                  text:
                      'The magic is here,having a huge databases and very advanced',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' AI ANALYZING ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF092E5C),
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                        text: 'system make you find your person very fast',
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
                  Navigator.pushNamed(context, Third.routeName);
                },
                child: CircularPercentIndicator(
                  radius: 50,
                  backgroundColor: Colors.white,
                  lineWidth: 5,
                  percent: .5,
                  progressColor: Color(0xFF092E5C),
                  center: Icon(Icons.arrow_forward,
                      color: Color(0xFF092E5C), size: 35),
                ),
              ),
            ),
            //firstOnBoardButton.png
          ],
        ),
      ),
    );
  }
}
