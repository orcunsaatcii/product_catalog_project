import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ContextExtension on BuildContext {
  TextStyle manrope(
          {required FontWeight fontWeight,
          Color? color,
          double? letterSpacing,
          double? fontSize}) =>
      GoogleFonts.manrope(
        textStyle: Theme.of(this).textTheme.bodyMedium?.copyWith(
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing,
              fontSize: fontSize,
            ),
      );
}
