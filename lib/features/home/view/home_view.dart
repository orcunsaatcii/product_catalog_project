import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalog_project/core/app/constants/app_constants.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/models/category.dart';
import 'package:product_catalog_project/core/models/product.dart';
import 'package:product_catalog_project/core/providers/categories_provider.dart';
import 'package:product_catalog_project/core/providers/products_provider.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';
import 'package:product_catalog_project/features/home/state/home_view_state.dart';
import 'package:product_catalog_project/features/home/widgets/category_button.dart';
import 'package:product_catalog_project/features/home/widgets/category_product_field.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with HomeViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, right: 20.w, left: 20.w),
        child: Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 20.h),
            const Divider(),
            _buildCategoryButtonList(),
            SizedBox(height: 20.h),
            const TextField(),
            SizedBox(height: 20.h),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final products = ref.watch(productProvider);
                  final categories = ref.watch(categoryProvider);

                  if (products == null || categories == null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return _buildCategoryProducts(categories, products);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/app_logo.png',
          fit: BoxFit.cover,
          width: 50.w,
        ),
        Text(
          'Catalog',
          style: context.manrope(
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
            fontSize: 20.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButtonList() {
    return SizedBox(
      height: 42.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5.w),
        itemCount: categoryButtons.length,
        itemBuilder: (context, index) => CategoryButton(
          text: categoryButtons[index],
        ),
      ),
    );
  }

  Widget _buildCategoryProducts(
      List<Category> categories, List<Product> products) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final productsByCategory = products
            .where((product) => product.category?.id == category.id)
            .toList();

        return CategoryProductField(
          category: category,
          products: productsByCategory,
        );
      },
    );
  }
}
