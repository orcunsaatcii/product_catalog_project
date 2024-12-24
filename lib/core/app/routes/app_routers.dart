import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/core/app/routes/route_enums.dart';
import 'package:product_catalog_project/features/auth/view/login_view.dart';
import 'package:product_catalog_project/features/auth/view/register_view.dart';
import 'package:product_catalog_project/features/home/view/home_view.dart';
import 'package:product_catalog_project/features/splash/view/splash_view.dart';

/// This class will manage the route logic of our app
class RouteManager {
  /// Route manager
  static GoRouter routes = GoRouter(
    routes: [
      /// Splash page route
      GoRoute(
        path: Routes.splash.path,
        builder: (context, state) => const SplashView(),
      ),

      /// Login page route
      GoRoute(
        path: Routes.login.path,
        builder: (context, state) => const LoginView(),
      ),

      /// Register page route
      GoRoute(
        path: Routes.register.path,
        builder: (context, state) => const RegisterView(),
      ),

      /// Home page route
      GoRoute(
        path: Routes.home.path,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
