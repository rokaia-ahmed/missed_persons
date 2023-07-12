import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missed_people/core/shared_preferences/shared_pref_user.dart';
import 'package:missed_people/views/splash/Splash_Screen.dart';
import 'package:missed_people/views/home/cubit/home_cubit.dart';
import 'package:missed_people/views/on-board/first.dart';
import 'package:missed_people/views/on-board/second.dart';
import 'package:missed_people/views/on-board/third.dart';
import 'package:missed_people/views/search/screens/search_screen.dart';

import 'core/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUser.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllPosts(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          First.routeName: (context) => const First(),
          Second.routeName: (context) => const Second(),
          Third.routeName: (context) => Third(),
          SearchScreen.routeName: (context) => const SearchScreen(),
        },
        home: SplashScreen(),
      ),
    );
  }
}
