import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/utils/dio_client.dart';

class CourseRepository {
  final DioClient dioClient;

  CourseRepository(this.dioClient);

  Future<Map<String, dynamic>> courses() async {
    final response = await dioClient.getWithToken('my-courses');
    return response.data;
  }
}
