import 'package:flutter_riverpod/flutter_riverpod.dart';

class RememberMeNotifier extends StateNotifier<bool> {
  RememberMeNotifier() : super(false);

  void toggleRememberMe(value) {
    state = value;
  }
}

final rememberMeProvider = StateNotifierProvider<RememberMeNotifier, bool>(
  (ref) => RememberMeNotifier(),
);
