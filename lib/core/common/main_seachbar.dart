import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class MainSeachbar extends ConsumerWidget {
  const MainSeachbar(
      {super.key, required this.controller, required this.onChanged});

  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
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
        suffixIcon: Icon(
          Icons.filter_alt,
          color: AppColors.textColor.withOpacity(0.6),
        ),
        hintText: AppLocalizations.of(context)!.search,
        hintStyle: context.manrope(
          fontWeight: FontWeight.w400,
          color: AppColors.textColor.withOpacity(0.6),
          fontSize: 16.sp,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
