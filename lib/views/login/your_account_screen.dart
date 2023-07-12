import 'package:flutter/material.dart';
import 'package:missed_people/core/utils/app_colors.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/home/widgets/app_widgets.dart';

import '../layout/screens/layout_screen.dart';

class your_account_screen extends StatelessWidget {
  your_account_screen({Key? key}) : super(key: key);
  TextEditingController textMobileController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  TextEditingController textConfirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.05,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(
                            'https://th.bing.com/th/id/OIP.C4_ifNigEcuZrZttvlxbgwAAAA?pid=ImgDet&w=358&h=358&rs=1'),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                const Center(
                  child: Text(
                    'Mohamed Said',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                const Text(
                  'Mobil Number',
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
                  "+20",
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                const Text(
                  'Your password',
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
                  true,
                  "************",
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey,
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
                  true,
                  "************",
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.05,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LayOutScreen(),
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
                    'Go To Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
