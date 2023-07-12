import 'package:flutter/material.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';

class SettingScreen extends StatefulWidget {
   const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
   int groupVal=1;
   bool value=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.primaryColor ,
        centerTitle:true ,
        title: const Text(AppStrings.setting,
          style:TextStyle(
            color: Colors.white,
          ) ,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.height*0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode',
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                 ),
                ),
                Container(
                  height:30 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  child: Switch(value: value,
                      inactiveTrackColor:Colors.white ,
                      activeTrackColor:Colors.white ,
                      activeColor:AppColors.primaryColor ,
                      inactiveThumbColor:AppColors.primaryColor ,
                      onChanged: (bool v){
                      setState(() {
                        value=v;
                      });
                      },
                  ),
                ),
              ],
            ),
            SizedBox(height: context.height*0.05),
            const Text('Language',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.height*0.01),
            RadioListTile(value: 1,
                groupValue: groupVal,
                onChanged:(newVal){
                setState(() {
                  groupVal=newVal!;
                });
                },
                activeColor:AppColors.primaryColor ,
                title: const Text('Arabic',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 16,
                 ),
                ),
            ),
            RadioListTile(value: 2,
              groupValue: groupVal,
              onChanged:(newVal){
              setState(() {
                groupVal=newVal!;
              });
              },
              activeColor:AppColors.primaryColor ,
              title: const Text('English',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
