import 'package:flutter/foundation.dart' show immutable;
import 'package:rhema_mena_student_app/features/course/data/models/course_model.dart';
import 'package:rhema_mena_student_app/features/course/domain/entities/course_entity.dart';

@immutable
class CourseListFetched {
  final String? level;
  final Resource? resource;

  const CourseListFetched({this.level, this.resource});
}
