import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalog_project/core/app/routes/app_routers.dart';
import 'package:product_catalog_project/core/di/injectable.dart';
import 'package:product_catalog_project/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() {
  configureDependencies();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: RouteManager.routes,
          debugShowCheckedModeBanner: false,
          supportedLocales: L10n.all,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        );
      },
    );
  }
}
