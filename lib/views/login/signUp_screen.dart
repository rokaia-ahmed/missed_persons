import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:missed_people/core/API/user.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/home/widgets/app_widgets.dart';
import 'package:missed_people/views/login/logIn_screen.dart';
import 'package:missed_people/views/login/verification_screen.dart';

import '../../core/utils/app_colors.dart';

class signUp_screen extends StatefulWidget {
  signUp_screen({
    Key? key,
  }) : super(key: key);

  @override
  State<signUp_screen> createState() => _signUp_screenState();
}

class _signUp_screenState extends State<signUp_screen> {
  TextEditingController textEmailController = TextEditingController();

  TextEditingController textNameController = TextEditingController();

  TextEditingController textMobileController = TextEditingController();

  TextEditingController textPasswordController = TextEditingController();

  TextEditingController textConfirmPasswordController = TextEditingController();

  bool isShownPass = false;
  bool isShownConfirmPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign up',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.height * 0.04,
              ),
              const Text(
                'Name',
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
                textNameController,
                TextInputType.text,
                false,
                'Client',
              ),
              SizedBox(
                height: context.height * 0.02,
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
                'Mobile Number',
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
                textMobileController,
                TextInputType.phone,
                false,
                "01234567890",
                maxLength: 11,
                icon: const Icon(
                  Icons.phone,
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
                !isShownPass,
                "************",
                icon: GestureDetector(
                  onTap: () {
                    isShownPass = !isShownPass;
                    setState(() {});
                  },
                  child: Icon(
                    isShownPass
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              const Text(
                'Confirm Password',
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
                textConfirmPasswordController,
                TextInputType.text,
                !isShownConfirmPass,
                "************",
                icon: GestureDetector(
                  onTap: () {
                    isShownConfirmPass = !isShownConfirmPass;
                    setState(() {});
                  },
                  child: Icon(
                    isShownConfirmPass
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              MaterialButton(
                onPressed: () async {
                  if (textNameController.text.length > 1 &&
                      textMobileController.text.length == 11 &&
                      textMobileController.text[0] == '0' &&
                      textPasswordController.text.length >= 8 &&
                      textPasswordController.text ==
                          textConfirmPasswordController.text &&
                      EmailValidator.validate(textEmailController.text)) {
                    AppWidgets.showLoading(context);
                    Map<String, dynamic>? response = await signUp(
                        context,
                        textNameController.text,
                        textMobileController.text,
                        textEmailController.text,
                        textPasswordController.text);
                    Navigator.pop(context);
                    if (response != null) {
                      print('signed up  successfully');

                      print('response is $response');
                      // PrefUser.setUser(response);

                      await sendOTP(context, response['id']);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              VerificationScreen(userData: response),
                        ),
                      );
                    }
                  } else {
                    if (!EmailValidator.validate(textEmailController.text)) {
                      AppWidgets.showMessage(context, 'Invalid email');
                    } else if (textPasswordController.text.length < 8 ||
                        textConfirmPasswordController.text.length < 8 ||
                        textPasswordController.text !=
                            textConfirmPasswordController.text) {
                      AppWidgets.showMessage(
                          context, "Check passwords' fields");
                    } else if (textNameController.text.isEmpty) {
                      AppWidgets.showMessage(context, "Check name field");
                    } else {
                      AppWidgets.showMessage(context, "Invalid mobile number");
                    }
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              const Center(
                child: Text(
                  'by clicking on sign up you accept our \n terms and privacy policy',
                  style: TextStyle(color: AppColors.borderColor),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?,",
                    style: TextStyle(color: AppColors.borderColor),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => logIn_screen(),
                          ),
                        );
                      },
                      child: const Text(
                        ' Sign In',
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
