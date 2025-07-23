import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/utils/storage_util.dart';
import 'package:testapp/models/user_model.dart'; // adjust the path if needed

final getUserInfoProvider = FutureProvider<UserModel?>((ref) async {
  final json = await StorageUtil.getJson("user");
  if (json == null) return null;
  return UserModel.fromJson(json);
});
