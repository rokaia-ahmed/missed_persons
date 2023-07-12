import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:missed_people/views/home/cubit/home_cubit.dart';
import 'package:missed_people/views/home/cubit/home_states.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';

class NoMatchWidget extends StatelessWidget {
  const NoMatchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  HomeCubit cubit = BlocProvider.of(context);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: AppColors.imageColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.file(
                      cubit.image!,
                      height: 300,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
              SvgPicture.asset('assets/images/wrongCheck.svg',
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'We are very sorry\nNo Matches',
                style: AppFonts.poppinsLight
                    .copyWith(color: AppColors.redColor),
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Turn on our matches alarm to get notified when we find matches',
                      style: AppFonts.poppinsLight
                          .copyWith(color: AppColors.redColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'NOTIFY ME',
                      style: AppFonts.poppins.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
