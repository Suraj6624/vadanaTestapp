import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/utils/dio_client.dart';

class AuthRepository {
  final DioClient dioClient;

  AuthRepository(this.dioClient);

  Future<Map<String, dynamic>> login(String phone, String password) async {
    final response = await dioClient.post(
      'login',
      data: {'phone': phone, 'password': password},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getProfile(String token) async {
    final response = await dioClient.getWithToken('profile');
    return response.data;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return AuthRepository(dioClient);
});
