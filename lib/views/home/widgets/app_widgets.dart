import 'package:flutter/material.dart';
import 'package:missed_people/core/shared_preferences/shared_pref_user.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/login/logIn_screen.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/navigator.dart';
import '../../search/screens/search_by_photo.dart';
import '../../search/screens/search_screen.dart';
import '../../setting/screens/setting_screen.dart';
import '../screens/edit_profile.dart';

class AppWidgets {
  static customAppBar(BuildContext context, Widget? leadingWidget,
      List<Widget>? actionButton, Widget? title,
      {Color? backgroundColor}) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
      centerTitle: true,
      leading: leadingWidget,
      title: title,
      actions: actionButton ??
          [
            Padding(
              padding: EdgeInsets.only(right: 10, top: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: PrefUser.getUser()!.picture.isNotEmpty
                    ? Image.network(
                        PrefUser.getUser()!.picture,
                      ).image
                    : const NetworkImage(
                        'https://th.bing.com/th/id/OIP.C4_ifNigEcuZrZttvlxbgwAAAA?pid=ImgDet&w=358&h=358&rs=1'),
              ),
            ),
          ],
    );
  }

  static customDrawer(BuildContext context) {
    return Drawer(
      width: context.width * 0.6,
      elevation: 0.0,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: context.height * 0.2,
            color: AppColors.primaryColor,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    AppStrings.missing,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    AppStrings.person,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: context.height * 0.05),
          CircleAvatar(
            radius: 50,
            backgroundImage: PrefUser.getUser()!.picture.isNotEmpty
                ? Image.network(
                    PrefUser.getUser()!.picture,
                  ).image
                : const NetworkImage(
                    'https://th.bing.com/th/id/OIP.C4_ifNigEcuZrZttvlxbgwAAAA?pid=ImgDet&w=358&h=358&rs=1'),
          ),
          SizedBox(height: context.height * 0.02),
          ListTile(
            onTap: () {
              AppNavigator.push(
                context: context,
                screen: const EditProfile(),
              );
            },
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              'About us',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          ListTile(
            onTap: () {
              AppNavigator.push(
                  context: context, screen: const SettingScreen());
            },
            title: const Text(
              'Setting',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),

          /// sign out
          ListTile(
            onTap: () {
              PrefUser.clearUser();
              AppNavigator.push(context: context, screen: logIn_screen());
            },
            title: const Text(
              'Sign out',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  static customHomePage(BuildContext context) {
    return SizedBox(
      height: context.height * 0.07,
      child: TextFormField(
        onTap: () {
          AppNavigator.push(context: context, screen: const SearchScreen());
        },
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[300]!)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[300]!)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              )),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 24,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          suffixIcon: InkWell(
            onTap: () {
              AppNavigator.push(
                  context: context, screen: const SearchByPhoto());
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
              child: Image.asset(
                AppAssets.searchIcon,
                height: 20,
                width: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static customTextFormField(
    BuildContext context,
    TextEditingController controller,
    TextInputType keyboardType,
    bool obsecured,
    String hintText, {
    Widget? icon,
    int? maxLength,
  }) {
    return SizedBox(
      height: context.height * 0.07,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: Colors.grey,
        obscureText: obsecured,
        maxLength: maxLength,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[300]!)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[300]!)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              )),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          suffixIcon: icon ??
              const Icon(
                Icons.edit,
                color: AppColors.primaryColor,
                size: 18,
              ),
        ),
      ),
    );
  }

  static showMessage(
    BuildContext context,
    String text, {
    bool isError = true,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  static void showLoading(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
  }

  static Widget verificationCode(
    BuildContext context,
    bool autoFocus,
    TextEditingController controller,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.17,
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.015,
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.borderColor,
        shape: BoxShape.rectangle,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          controller: controller,
          autofocus: autoFocus,
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 42,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 1,
          cursorWidth: 0,
          maxLength: 1,
          onChanged: (value) {
            if (value.isNotEmpty) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).previousFocus();
            }
          },
        ),
      ),
    );
  }
}
