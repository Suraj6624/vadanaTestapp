import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/repositoy/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/utils/storage_util.dart';

enum AuthStatus { initial, loading, success, error }

class AuthState {
  final AuthStatus status;
  final String? errorMessage;
  final Map<String, dynamic>? user;

  AuthState({this.status = AuthStatus.initial, this.errorMessage, this.user});

  AuthState copyWith({
    AuthStatus? status,
    String? errorMessage,
    Map<String, dynamic>? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      user: user ?? this.user,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository repository;

  AuthController(this.repository) : super(AuthState());

  Future<void> login(String phone, String password) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);
    try {
      final result = await repository.login(phone, password);

      state = state.copyWith(status: AuthStatus.success, user: result);
      // print(state.user!['user']);
      StorageUtil.saveString("token", state.user!['token']);
      StorageUtil.saveJson("user", state.user!['user']);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> fetchProfile(String token) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);
    try {
      final result = await repository.getProfile(token);
      state = state.copyWith(status: AuthStatus.success, user: result);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final repo = ref.watch(authRepositoryProvider);
    return AuthController(repo);
  },
);
