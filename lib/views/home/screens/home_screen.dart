import 'package:flutter/material.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/home/screens/edit_profile.dart';

import '../../../core/shared_preferences/shared_pref_user.dart';
import '../../../core/utils/app_strings.dart';
import '../widgets/app_widgets.dart';
import '../widgets/custom_post.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.height * 0.085),
          child: AppWidgets.customAppBar(
              context,
              null,
              [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(),
                        ));
                  },
                  child: Padding(
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
                ),
              ],
              Column(
                children: const [
                  Text(
                    AppStrings.missing,
                    style: TextStyle(
                      color: Colors.white,
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
              ))),
      drawer: AppWidgets.customDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.customHomePage(context),
            SizedBox(height: context.height * 0.03),
            const Text(
              'Feed',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
            SizedBox(height: context.height * 0.01),
            const CustomPost(),
          ],
        ),
      ),
    );
  }
}
