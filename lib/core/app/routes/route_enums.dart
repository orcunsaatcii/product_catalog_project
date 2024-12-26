/// Routes enum
enum Routes {
  /// Splash route
  splash('/'),

  /// Login route
  login('/login'),

  /// Register route
  register('/register'),

  // Home route
  home('/home'),

  // All prdoucts route
  allProducts('/allProducts'),

  // Product detail route
  productDetail('/productDetail');

  const Routes(this.path);

  /// Path of route
  final String path;
}
