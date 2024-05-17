import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/common/usecase/usecase.dart';
import 'package:rhema_mena_student_app/features/course/data/models/course_model.dart';
// import 'package:rhema_mena_student_app/features/course/domain/entities/course_entity.dart';
import 'package:rhema_mena_student_app/features/course/domain/repositories/course_repository.dart';

class GetCourseListUseCase
    implements UseCase<List<CourseModel>, GetCourseParams> {
  final CourseRepository courseRepository;

  const GetCourseListUseCase(this.courseRepository);

  @override
  Future<ApiResult<List<CourseModel>>> call(GetCourseParams params) async {
    return await courseRepository.getCourseList(
        level: params.level, resource: params.resource);
  }
}

class GetCourseParams {
  final String? level;
  final Resource? resource;

  const GetCourseParams({this.level, this.resource});
}
