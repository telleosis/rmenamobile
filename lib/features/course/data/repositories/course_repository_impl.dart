import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/common/repository/repository_helper.dart';
import 'package:rhema_mena_student_app/features/course/data/models/course_model.dart';
import 'package:rhema_mena_student_app/features/course/domain/entities/course_entity.dart';
import 'package:rhema_mena_student_app/features/course/domain/repositories/course_repository.dart';
import 'package:rhema_mena_student_app/features/course/data/datasources/course_remote_data_sources.dart';

class CourseRepositoryImpl extends CourseRepository
    with RepositoryHelper<CourseModel> {
  final CourseRemoteDataSource remoteDataSource;

  CourseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<CourseModel>>> getCourseList(
      {String? level, Resource? resource}) async {
    return checkItemsFailOrSuccess(
      remoteDataSource.getCourseList(level: level, resource: resource),
    );
  }

  @override
  Future<ApiResult<List<CourseModel>>> getCourse(CourseModel course) {
    return checkItemsFailOrSuccess(remoteDataSource.getCourse(course));
  }
}
