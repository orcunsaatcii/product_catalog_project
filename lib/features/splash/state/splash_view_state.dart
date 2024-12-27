import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/core/services/auth_service.dart';
import 'package:product_catalog_project/features/splash/view/splash_view.dart';

mixin SplashViewState on State<SplashView> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    timer = Timer(const Duration(seconds: 3), checkToken);
  }

  void goLoginPage() {
    context.go('/login');
  }

  Future<void> checkToken() async {
    final token = await AuthService().getToken();
    if (token != null) {
      if (mounted) {
        context.go('/home');
      }
    } else {
      if (mounted) {
        context.go('/login');
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
