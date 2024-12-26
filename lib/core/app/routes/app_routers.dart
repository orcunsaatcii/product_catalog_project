import 'package:go_router/go_router.dart';
import 'package:product_catalog_project/core/app/routes/route_enums.dart';
import 'package:product_catalog_project/core/models/product.dart';
import 'package:product_catalog_project/features/all_products/view/all_products_view.dart';
import 'package:product_catalog_project/features/auth/view/login_view.dart';
import 'package:product_catalog_project/features/auth/view/register_view.dart';
import 'package:product_catalog_project/features/home/view/home_view.dart';
import 'package:product_catalog_project/features/product_detail/view/product_detail_view.dart';
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

      /// All products page route
      GoRoute(
        path: Routes.allProducts.path,
        builder: (context, state) {
          final categoryName = state.extra as String;

          return AllProductsView(
            categoryName: categoryName,
          );
        },
      ),

      /// Product detail page route
      GoRoute(
        path: Routes.productDetail.path,
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetailView(
            product: product,
          );
        },
      ),
    ],
  );
}
