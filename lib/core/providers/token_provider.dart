import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenNotifier extends StateNotifier<String?> {
  TokenNotifier() : super(null);

  void setToken(String token) {
    state = token;
  }
}

final tokenProvider = StateNotifierProvider<TokenNotifier, String?>(
  (ref) => TokenNotifier(),
);
