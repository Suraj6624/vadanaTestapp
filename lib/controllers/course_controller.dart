import 'package:testapp/models/course_model.dart';
import 'package:testapp/repositoy/course_repository.dart';

class CourseController {
  final CourseRepository repository = CourseRepository();

  Future<CourseModel> fetchCourses() async {
    final response = await repository.courses();
    return CourseModel.fromJson(response);
  }
}
