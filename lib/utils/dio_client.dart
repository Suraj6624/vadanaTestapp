import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/utils/app_constants.dart';
import 'package:testapp/utils/storage_util.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );
});

class DioClient {
  final Dio dio;
  DioClient(this.dio);

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
      String? token = await StorageUtil.getString("token");
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
      String? token = await StorageUtil.getString("token");
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
    // Optional: log or customize error messages
    print('Dio Error => ${e.message}, ${e.response?.data}');
  }
}

/// Provide DioClient with dependency injection
final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioProvider);
  return DioClient(dio);
});
