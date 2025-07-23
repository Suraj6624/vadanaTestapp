import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/providers/dio_provider.dart';
import 'package:testapp/providers/get_auth_token.dart';
import 'package:testapp/utils/app_constants.dart';
import 'package:testapp/utils/storage_util.dart';

/// Provides Dio instance

/// Dio client class with all HTTP methods
class DioClient {
  final Dio dio;
  final Ref ref;

  DioClient(this.dio, this.ref);

  /// GET request without token
  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final res = await dio.get(path, queryParameters: queryParams);
      return res;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// POST request without token
  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      final res = await dio.post(path, data: data);
      return res;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// GET request with token
  Future<Response> getWithToken(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final token = await ref.read(getAuthTokenProvider.future);
      final res = await dio.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return res;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// POST request with token
  Future<Response> postWithToken(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final token = await ref.read(getAuthTokenProvider.future);
      final res = await dio.post(
        path,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return res;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  void _handleDioError(DioException e) {
    print('Dio Error => ${e.message}, ${e.response?.data}');
  }
}

/// Provides DioClient instance with injected Dio and Ref
final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioProvider);
  return DioClient(dio, ref);
});
