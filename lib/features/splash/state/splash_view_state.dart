import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/features/splash/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');

    if (token == null) {
      if (mounted) {
        context.go('/login');
      }
    } else {
      if (mounted) {
        context.go('/home');
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
