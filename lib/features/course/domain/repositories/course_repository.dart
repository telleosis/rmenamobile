import 'dart:async';

import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/features/course/data/models/course_model.dart';
// import 'package:rhema_mena_student_app/features/course/domain/entities/course_entity.dart';

abstract class CourseRepository {
  Future<ApiResult<List<CourseModel>>> getCourseList(
      {String? level, Resource? resource});

  Future<ApiResult<List<CourseModel>>> getCourse(CourseModel course);
}
