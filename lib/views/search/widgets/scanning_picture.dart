import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missed_people/views/home/cubit/home_cubit.dart';
import 'package:missed_people/views/home/cubit/home_states.dart';
import '../../../core/utils/app_colors.dart';

class ScanningPicture extends StatelessWidget {
  const ScanningPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  HomeCubit cubit = BlocProvider.of(context);
                  return Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: AppColors.imageColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.file(
                      cubit.image!,
                      height: 250,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
              Image.asset('assets/images/scanning.png',
                height: 220,
                width: 220,
                fit: BoxFit.fill,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Text('Our system is scanning your photo',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
