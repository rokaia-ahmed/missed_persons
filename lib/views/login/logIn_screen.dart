import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:missed_people/core/API/user.dart';
import 'package:missed_people/core/utils/app_colors.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/login/signUp_screen.dart';

import '../../core/shared_preferences/shared_pref_user.dart';
import '../home/widgets/app_widgets.dart';
import '../layout/screens/layout_screen.dart';

class logIn_screen extends StatefulWidget {
  logIn_screen({Key? key}) : super(key: key);

  @override
  State<logIn_screen> createState() => _logIn_screenState();
}

class _logIn_screenState extends State<logIn_screen> {
  TextEditingController textEmailController = TextEditingController();

  TextEditingController textPasswordController = TextEditingController();

  bool isShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign in',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              const Text(
                'Email',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              AppWidgets.customTextFormField(
                context,
                textEmailController,
                TextInputType.emailAddress,
                false,
                "user@gmail.com",
                icon: const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              AppWidgets.customTextFormField(
                context,
                textPasswordController,
                TextInputType.text,
                !isShown,
                "************",
                icon: GestureDetector(
                  onTap: () {
                    isShown = !isShown;
                    setState(() {});
                  },
                  child: Icon(
                    isShown
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const VerificationScreen(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'forget password?',
                      style: TextStyle(color: AppColors.borderColor),
                    ),
                  )),
              MaterialButton(
                onPressed: () async {
                  if (textEmailController.text.isNotEmpty &&
                      textPasswordController.text.isNotEmpty &&
                      EmailValidator.validate(textEmailController.text)) {
                    AppWidgets.showLoading(context);
                    Map<String, dynamic>? response = await login(
                      context,
                      textEmailController.text,
                      textPasswordController.text,
                    );
                    Navigator.pop(context);
                    if (response != null) {
                      print('logged in successfully!!');
                      print('response: $response');
                      PrefUser.setUser(response);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LayOutScreen(),
                        ),
                      );
                    }
                  } else {
                    AppWidgets.showMessage(
                        context, 'Invalid email and/or password');
                  }
                },
                minWidth: double.infinity,
                color: AppColors.primaryColor,
                height: context.height * 0.07,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?,",
                    style: TextStyle(color: AppColors.borderColor),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => signUp_screen(),
                          ),
                        );
                      },
                      child: const Text(
                        ' Sign up',
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 18),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
