import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/common/main_button.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';
import 'package:product_catalog_project/features/splash/state/splash_view_state.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 287.h),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/app_logo.png',
                fit: BoxFit.cover,
                width: 200.w,
              ),
              SizedBox(
                height: 287.h,
              ),
              MainButton(
                text: AppLocalizations.of(context)!.login,
                onTap: () {
                  timer?.cancel();
                  goLoginPage();
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {
                  timer?.cancel();
                  checkToken();
                },
                child: Text(
                  AppLocalizations.of(context)!.skip,
                  style: context.manrope(
                    fontWeight: FontWeight.w600,
                    color: AppColors.categoryButtonColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
