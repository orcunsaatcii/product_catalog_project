import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/models/product.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/productDetail', extra: product);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        width: 210.w,
        height: 140.h,
        decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Hero(
              tag: product.id.toString(),
              child: Image.network(
                product.image?.url ?? '',
                width: 80.w,
                height: 120.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.broken_image,
                  size: 100.h,
                  color: AppColors.textFieldColor,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? '',
                        style: context.manrope(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                      ),
                      Text(
                        product.author ?? '',
                        style: context.manrope(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${product.price.toString()} \$',
                    style: context.manrope(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.categoryButtonColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
