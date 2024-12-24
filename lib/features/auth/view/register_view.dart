import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/common/main_button.dart';
import 'package:product_catalog_project/core/common/main_textfield.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';
import 'package:product_catalog_project/features/auth/state/register_view_state.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView>
    with RegisterViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 60.h,
          right: 20.w,
          left: 20.w,
        ),
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
                'Welcome',
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
                'Register an account',
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
                      'Name',
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
                      controller: nameController,
                      hintText: 'John Doe',
                      validator: validateName,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      'Login',
                      style: context.manrope(
                        fontWeight: FontWeight.bold,
                        color: AppColors.categoryButttonColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    onPressed: () {
                      context.go('/login');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              MainButton(
                text: 'Register',
                onTap: () => signUp(context, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
