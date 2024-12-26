import 'package:flutter/material.dart';
import 'package:product_catalog_project/core/app/theme/app_colors.dart';
import 'package:product_catalog_project/core/utils/text/text_style.dart';

extension ShowSnackBar on BuildContext {
  /// Displays a basic snackbar
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.green,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        style: context.manrope(
          fontWeight: FontWeight.normal,
          color: AppColors.white,
        ),
      ),
      backgroundColor: backgroundColor,
    ));
  }

  /// Displays a red snackbar indicating error
  void showErrorSnackBar({required String message}) {
    showSnackBar(
      message: message,
      backgroundColor: Colors.red,
      context: this,
    );
  }
}

List<String> categoryButtons = ['All', 'Classics', 'Horror', 'Romance'];
const String constantUrl = 'https://assign-api.piton.com.tr/api/rest';
