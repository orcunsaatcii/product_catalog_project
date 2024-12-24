import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.isLoading = false});

  final String text;
  final bool isLoading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 350.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.white,
                )
              : Text(
                  text,
                  style: context.manrope(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
        ),
      ),
    );
  }
}
