import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/utils/storage_util.dart';

final getAuthTokenProvider = FutureProvider<String?>((ref) async {
  return await StorageUtil.getString("token");
});
