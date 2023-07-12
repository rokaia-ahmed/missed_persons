import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({required this.controller,required this.hintText  ,Key? key}) : super(key: key);
     final TextEditingController controller;
     final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      keyboardType: TextInputType.name,
      style: AppFonts.poppinsLight,
      validator: (value) {
        if (value!.isEmpty) {
          return 'this field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppFonts.poppinsLight.copyWith(
          color: Colors.black45,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide:  const BorderSide(
            color: AppColors.borderColor,
          ),
        ),
      ),
    );
  }
}
