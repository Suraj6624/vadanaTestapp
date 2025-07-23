import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/utils/dio_client.dart';

class CourseRepository {
  late final Ref _ref;

  void init(Ref ref) {
    _ref = ref;
  }

  Future<Map<String, dynamic>> courses() async {
    final dioClient = _ref.read(dioClientProvider);
    final response = await dioClient.getWithToken('my-courses');
    return response.data;
  }
}
