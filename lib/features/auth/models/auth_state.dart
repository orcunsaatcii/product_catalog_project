class AuthState {
  AuthState({
    this.data,
    this.isLoading = false,
  });

  Map<String, dynamic>? data;
  bool isLoading;
}
