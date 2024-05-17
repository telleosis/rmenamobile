import 'package:rhema_mena_student_app/di.dart';
import 'package:rhema_mena_student_app/common/network/api_config.dart';
import 'package:rhema_mena_student_app/common/network/api_helper.dart';
import 'package:rhema_mena_student_app/common/network/dio_client.dart';
import 'package:rhema_mena_student_app/features/course/data/models/course_model.dart';
import 'package:rhema_mena_student_app/features/course/domain/entities/course_entity.dart';

abstract class CourseRemoteDataSource {
  Future<List<CourseModel>> getCourseList({String? level, Resource? resource});
  Future<List<CourseModel>> getCourse(CourseModel course);
}

class CourseRemoteDataSourceImpl
    with ApiHelper<CourseModel>
    implements CourseRemoteDataSource {
  final DioClient dioClient = getIt<DioClient>();

  @override
  Future<List<CourseModel>> getCourseList(
      {String? level, Resource? resource}) async {
    Map<String, String>? queryParameters = <String, String>{};

    if (level != null && level != "") {
      queryParameters.addAll({'level': level});
    }

    return await makeGetRequest(
      dioClient.dio.get(ApiConfig.courseList, queryParameters: queryParameters),
      CourseModel.fromJson,
    );
  }

  @override
  Future<List<CourseModel>> getCourse(CourseModel course) async {
    final queryParameters = {
      'course': '${course.title}',
      'level': '${course.level}',
    };

    return await makeGetRequest(
        dioClient.dio.get(ApiConfig.getClass, queryParameters: queryParameters),
        CourseModel.fromJson);
  }
}
