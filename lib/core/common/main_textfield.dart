import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';

class MainTextfield extends StatefulWidget {
  const MainTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscure = false,
      required this.validator});

  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  final String? Function(String?)? validator;

  @override
  State<MainTextfield> createState() => _MainTextfieldState();
}

class _MainTextfieldState extends State<MainTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFieldColor,
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText,
        hintStyle: context.manrope(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: AppColors.textColor.withOpacity(0.6),
        ),
      ),
      validator: widget.validator,
    );
  }
}
