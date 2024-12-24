import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/core/app/constants/app_constants.dart';
import 'package:product_catalog_project/core/di/injectable.dart';
import 'package:product_catalog_project/core/repositories/auth_repository.dart';
import 'package:product_catalog_project/features/auth/view/register_view.dart';

mixin RegisterViewState on ConsumerState<RegisterView> {
  final formKey = GlobalKey<FormState>();
  final AuthRepository _authRepository = getIt<AuthRepository>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter a name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (value == null || value.trim().isEmpty) {
      return 'Enter an e-mail';
    }
    if (!emailRegex.hasMatch(value)) {
      return 'Enter an email in the correct format';
    }
    return null;
  }

  String? validatePassword(String? value) {
    final passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$');
    if (value == null || value.isEmpty) {
      return 'Enter a password';
    }
    if (value.length < 6 || value.length > 20) {
      return 'Password must be between 6-20 characters';
    }
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be alphanumeric';
    }
    return null;
  }

  Future<void> signUp(BuildContext context, WidgetRef ref) async {
    if (formKey.currentState!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final password = passwordController.text;

      final response = await _authRepository.signUp(name, email, password);

      if (response['status'] == 'success') {
        // ignore: use_build_context_synchronously
        context.go('/home');
      } else {
        if (mounted) {
          // ignore: use_build_context_synchronously
          context.showErrorSnackBar(message: response['message']);
        }
      }
    }
  }
}
