import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';

class SearchWidget extends StatelessWidget {
   const SearchWidget({Key? key}) : super(key: key);
   final bool isLoading = false;
   final bool doneScanning = true;
   final bool foundMatch = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 130, left: 35, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    height: 320,
                    width: 320,
                    decoration: BoxDecoration(
                      color: AppColors.imageColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Visibility(
                      visible: doneScanning,
                      child: SvgPicture.asset(
                        foundMatch
                            ? 'assets/images/rightCheck.svg'
                            : 'assets/images/wrongCheck.svg',
                        height: 250,
                        width: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            !doneScanning
                ? Text(
              isLoading && !doneScanning
                  ? 'Your photo is scanning now'
                  : !isLoading && !doneScanning
                  ? 'Our system is scanning your photo '
                  : '',
              style: AppFonts.poppinsLight.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600),
            )
                : foundMatch
                ? Text(
              'We found a match for your photo',
              style: AppFonts.poppinsLight.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.greenColor,
              ),
            )
                : Column(
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
      ),
    );
  }
}
