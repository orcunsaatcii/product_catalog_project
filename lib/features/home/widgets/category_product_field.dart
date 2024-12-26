import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/models/category.dart';
import 'package:product_catalog_project/core/models/product.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';
import 'package:product_catalog_project/features/home/widgets/product_item.dart';

class CategoryProductField extends StatelessWidget {
  final Category category;
  final List<Product> products;

  const CategoryProductField({
    super.key,
    required this.category,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              category.name!,
              style: context.manrope(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            TextButton(
              onPressed: () {
                context.push(
                  '/allProducts',
                  extra: {
                    'products': products,
                    'categoryName': category.name,
                  },
                );
              },
              child: Text(
                'View All',
                style: context.manrope(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.buttonColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 140.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItem(product: product);
            },
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
