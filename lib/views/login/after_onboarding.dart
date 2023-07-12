import 'package:flutter/material.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/login/logIn_screen.dart';
import 'package:missed_people/views/login/signUp_screen.dart';
import '../../core/utils/app_colors.dart';

class signIn_signUp extends StatelessWidget {
  const signIn_signUp({Key? key}) : super(key: key);
  static const String routeName = "signIn signUp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 250, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: const [
                  Text(
                    'MISSING',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  Text(
                    'PERSON',
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => logIn_screen(),
                        ),
                      );
                    },
                    minWidth: double.infinity,
                    color: AppColors.primaryColor,
                    height: context.height * 0.07,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    child: const Text(
                      'sign in',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => signUp_screen(),
                        ),
                      );
                    },
                    minWidth: double.infinity,
                    color: Colors.white,
                    height: context.height * 0.07,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 2),
                    ),
                    child: const Text(
                      'sign up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
