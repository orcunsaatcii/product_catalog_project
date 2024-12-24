import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/common/main_button.dart';
import 'package:product_catalog_project/core/common/main_textfield.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';
import 'package:product_catalog_project/features/auth/state/login_view_state.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with LoginViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, right: 20.w, left: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/app_logo.png',
                  fit: BoxFit.cover,
                  width: 100.w,
                ),
              ),
              SizedBox(
                height: 115.h,
              ),
              Text(
                'Welcome back!',
                style: context.manrope(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor.withOpacity(0.6),
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                'Login to your account',
                style: context.manrope(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 75.h,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'E-mail',
                      style: context.manrope(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    MainTextfield(
                      controller: emailController,
                      hintText: 'john@mail.com',
                      validator: validateEmail,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      'Password',
                      style: context.manrope(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    MainTextfield(
                      controller: passwordController,
                      hintText: '********',
                      obscure: true,
                      validator: validatePassword,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        activeColor: AppColors.categoryButttonColor,
                        side: const BorderSide(
                          width: 2,
                          color: AppColors.categoryButttonColor,
                        ),
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        'Remember Me',
                        style: context.manrope(
                          fontWeight: FontWeight.bold,
                          color: AppColors.categoryButttonColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    child: Text(
                      'Register',
                      style: context.manrope(
                        fontWeight: FontWeight.bold,
                        color: AppColors.categoryButttonColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    onPressed: () {
                      context.go('/register');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 155.h,
              ),
              MainButton(
                text: 'Login',
                onTap: () => signIn(context, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
