import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/common/main_seachbar.dart';
import 'package:product_catalog_project/core/providers/category_products_provider.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';
import 'package:product_catalog_project/features/all_products/state/all_products_view_state.dart';
import 'package:product_catalog_project/features/all_products/widgets/product_list_item.dart';

class AllProductsView extends ConsumerStatefulWidget {
  const AllProductsView({super.key, required this.categoryName});

  final String categoryName;

  @override
  ConsumerState<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends ConsumerState<AllProductsView>
    with AllProductsViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
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
              widget.categoryName,
              style: context.manrope(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
        child: Column(
          children: [
            MainSeachbar(
              controller: searchController,
              onChanged: (p0) {
                ref.read(categoryProductsProvider.notifier).filterProducts(p0);
              },
            ),
            SizedBox(height: 30.h),
            _buildProductList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return Consumer(
      builder: (context, ref, child) {
        final products = ref.watch(categoryProductsProvider);
        return Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              mainAxisExtent: 284.h,
            ),
            itemCount: products!.length,
            itemBuilder: (context, index) =>
                ProductListItem(product: products[index]),
          ),
        );
      },
    );
  }
}
