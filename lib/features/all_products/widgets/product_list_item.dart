import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/models/product.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/productDetail', extra: product);
      },
      child: Container(
        width: 170.w,
        height: 284.h,
        decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: product.id.toString(),
                  child: Image.network(
                    product.image?.url ?? '',
                    width: 150.w,
                    height: 225.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.broken_image,
                      size: 100.h,
                      color: AppColors.textFieldColor,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    product.name!.replaceFirst(
                        product.name![0], product.name![0].toUpperCase()),
                    style: context.manrope(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                      fontSize: 10.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        product.author ?? '',
                        style: context.manrope(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor.withOpacity(0.6),
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${product.price.toString()} \$',
                        style: context.manrope(
                          fontWeight: FontWeight.bold,
                          color: AppColors.categoryButtonColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
