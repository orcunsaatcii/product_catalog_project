import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/core/app/constants/app_constants.dart';
import 'package:product_catalog_project/core/providers/remember_me_provider.dart';
import 'package:product_catalog_project/core/repositories/auth_repository.dart';
import 'package:product_catalog_project/features/auth/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin LoginViewState on ConsumerState<LoginView> {
  bool isChecked = false;
  final AuthRepository _authRepository = GetIt.instance<AuthRepository>();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

  Future<void> signIn(BuildContext context, WidgetRef ref) async {
    final rememberMe = ref.read(rememberMeProvider);
    if (formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      final response = await _authRepository.signIn(email, password);
      final SharedPreferences sp = await SharedPreferences.getInstance();

      if (response['status'] == 'success') {
        await sp.setString('token', response['token']);
        if (rememberMe) {
          await sp.setString('token_expiry',
              DateTime.now().add(const Duration(hours: 24)).toIso8601String());
          await sp.setBool('remember', true);
        }
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
