import 'package:flutter/material.dart';
import 'package:missed_people/core/API/user.dart';
import 'package:missed_people/core/utils/app_colors.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/login/your_account_screen.dart';

import '../../core/shared_preferences/shared_pref_user.dart';
import '../home/widgets/app_widgets.dart';

class VerificationScreen extends StatelessWidget {
  Map<String, dynamic> userData;
  VerificationScreen({
    Key? key,
    required this.userData,
  }) : super(key: key);

  List<TextEditingController> otpControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryColor,
                    )),
                const Text(
                  'Verification Code',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Image.asset('assets/images/forget_password.png'),
            ),
            Column(
              children: [
                const Text(
                  'Confirmation code sent to your email',
                  style: TextStyle(
                      color: AppColors.borderColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    userData['email'] ?? '',
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 90,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppWidgets.verificationCode(
                          context, position == 0, otpControllers[position]),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     border: Border.all(
                      //       width: 1.5,
                      //       color: AppColors.primaryColor,
                      //     ),
                      //     borderRadius: BorderRadius.circular(8),
                      //     color: AppColors.borderColor,
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(25.0),
                      //     child: Text(
                      //       position.toString(),
                      //       style: const TextStyle(
                      //           fontSize: 20.0,
                      //           color: AppColors.primaryColor,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: MaterialButton(
                onPressed: () async {
                  if (otpControllers
                      .where((controller) => controller.text.isEmpty)
                      .isEmpty) {
                    bool verified = await verifyOTP(
                      context,
                      userData['id'],
                      otpControllers.fold(
                          '',
                          (String previousValue, controller) =>
                              previousValue + controller.text),
                    );
                    if (verified) {
                      PrefUser.setUser(userData);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => your_account_screen(),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  } else {
                    AppWidgets.showMessage(
                        context, 'Write the verification code');
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
                  'Verify',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
