import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/layout/cubit/states.dart';
import '../../../core/utils/app_colors.dart';
import '../cubit/cubit.dart';

class LayOutScreen extends StatelessWidget {
  const LayOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit = LayoutCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              height: context.height * 0.075,
              buttonBackgroundColor: AppColors.primaryColor,
              animationDuration: const Duration(
                milliseconds: 600,
              ),
              backgroundColor: Colors.transparent,
              index: cubit.currentIndex,
              onTap: (index) {
                cubit.changNavBar(index);
              },
              items: [
                Icon(
                  Icons.home_filled,
                  size: 30,
                  color: cubit.currentIndex == 0
                      ? Colors.white
                      : AppColors.primaryColor,
                ),
                Icon(
                  Icons.add,
                  size: 30,
                  color: cubit.currentIndex == 1
                      ? Colors.white
                      : AppColors.primaryColor,
                ),
                Icon(
                  Icons.settings,
                  size: 30,
                  color: cubit.currentIndex == 2
                      ? Colors.white
                      : AppColors.primaryColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
