import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';

class MainSeachbar extends StatelessWidget {
  const MainSeachbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.textFieldColor,
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.textColor.withOpacity(0.6),
        ),
        suffix: Image.asset(
          'assets/icons/filter.png',
          fit: BoxFit.cover,
          width: 20.w,
        ),
        hintText: 'Search',
        hintStyle: context.manrope(
          fontWeight: FontWeight.w400,
          color: AppColors.textColor.withOpacity(0.6),
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
