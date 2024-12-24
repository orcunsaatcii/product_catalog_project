import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/features/splash/view/splash_view.dart';

mixin SplashViewState on State<SplashView> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    timer = Timer(const Duration(seconds: 3), goLoginPage);
  }

  void goLoginPage() {
    context.go('/login');
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
