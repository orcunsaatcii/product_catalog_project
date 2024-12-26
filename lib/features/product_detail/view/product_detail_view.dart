import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/models/product.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImageAndDetails(context),
            SizedBox(height: 42.h),
            _buildSectionTitle(context, 'Summary'),
            SizedBox(height: 10.h),
            _buildProductDescription(context),
            SizedBox(height: 30.h),
            _buildBuyButton(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      bottom: const PreferredSize(
        preferredSize: Size(20, 20),
        child: Divider(
          color: AppColors.textFieldColor,
          thickness: 2,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Text(
            'Book Details',
            style: context.manrope(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductImageAndDetails(BuildContext context) {
    return Center(
      child: Column(
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
          SizedBox(height: 10.h),
          Text(
            product.name ?? '',
            style: context.manrope(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            product.author ?? '',
            style: context.manrope(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: context.manrope(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _buildProductDescription(BuildContext context) {
    return Text(
      product.description ?? 'No description',
      style: context.manrope(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor.withOpacity(0.6),
      ),
    );
  }

  Widget _buildBuyButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 350.w,
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${product.price.toString()} \$',
              style: context.manrope(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Text(
              'Buy Now',
              style: context.manrope(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
