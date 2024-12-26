import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/providers/active_category_provider.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';

class CategoryButton extends ConsumerWidget {
  const CategoryButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(activeCategoryProvider.notifier).selectCategory(text);
      },
      child: Consumer(
        builder: (context, ref, child) {
          final activeCategory = ref.watch(activeCategoryProvider);
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 42.h,
            decoration: BoxDecoration(
              color: activeCategory == text
                  ? AppColors.categoryButtonColor
                  : AppColors.textFieldColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              text,
              style: context.manrope(
                fontWeight:
                    activeCategory == text ? FontWeight.bold : FontWeight.w400,
                color: activeCategory == text
                    ? AppColors.white
                    : AppColors.textColor.withOpacity(0.6),
                fontSize: 16.sp,
              ),
            ),
          );
        },
      ),
    );
  }
}
