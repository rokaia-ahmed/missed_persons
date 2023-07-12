import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missed_people/views/add_posts/screens/add_posts_screens.dart';
import 'package:missed_people/views/home/screens/home_screen.dart';
import 'package:missed_people/views/layout/cubit/states.dart';
import 'package:missed_people/views/setting/screens/setting_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitialLayoutState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    AddPostsScreen(),
    SettingScreen(),
  ];
  void changNavBar(int index) {
    currentIndex = index;
    emit(ChangNavBarState());
  }
}
