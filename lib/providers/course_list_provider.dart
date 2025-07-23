import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/controllers/course_controller.dart';
import 'package:testapp/models/course_model.dart';

final getCourseListProvider = FutureProvider.autoDispose<CourseModel>((
  ref,
) async {
  return await CourseController().fetchCourses();
});
