import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/models/course_model.dart';
import 'package:testapp/repositoy/course_repository.dart';
import 'package:testapp/utils/dio_client.dart';

class CourseController {
  final CourseRepository repository;

  CourseController(this.repository);

  Future<CourseModel> fetchCourses() async {
    final response = await repository.courses();
    return CourseModel.fromJson(response);
  }
}

final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return CourseRepository(dioClient);
});

/// Course Controller Provider
final courseControllerProvider = Provider<CourseController>((ref) {
  final repo = ref.watch(courseRepositoryProvider);
  return CourseController(repo);
});

/// FutureProvider to load course list
final courseListProvider = FutureProvider<CourseModel>((ref) {
  final controller = ref.watch(courseControllerProvider);
  return controller.fetchCourses(); // no token param here either
});
