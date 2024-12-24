import 'package:injectable/injectable.dart';
import 'package:product_catalog_project/core/services/auth_service.dart';

@injectable
class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<Map<String, dynamic>> signUp(
      String name, String email, String password) async {
    final Map<String, dynamic> response =
        await _authService.signUp(name, email, password);

    return response;
  }

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final Map<String, dynamic> response =
        await _authService.signIn(email, password);

    print(response['token']);

    return response;
  }
}
