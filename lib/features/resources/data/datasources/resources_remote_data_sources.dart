import 'package:rhema_mena_student_app/di.dart';
import 'package:rhema_mena_student_app/common/network/api_config.dart';
import 'package:rhema_mena_student_app/common/network/api_helper.dart';
import 'package:rhema_mena_student_app/common/network/dio_client.dart';
import 'package:rhema_mena_student_app/features/resources/data/models/resource_model.dart';

abstract class ResourcesRemoteDataSource {
  Future<List<ResourceModel>>
      getResourcesList(); // getResourcesList({String? id, String? name});
  Future<List<ResourceModel>> getResource(ResourceModel resource);
}

class ResourcesRemoteDataSourceImpl
    with ApiHelper<ResourceModel>
    implements ResourcesRemoteDataSource {
  final DioClient dioClient = getIt<DioClient>();

  // @override
  // Future<List<ResourceModel>> getResourcesList(
  //     {String? id, String? name}) async {
  //   Map<String, String>? queryParameters = <String, String>{};

  //   if (name != null && name != "") {
  //     queryParameters.addAll({'name': name});
  //   }

  //   return await makeGetRequest(
  //       dioClient.dio
  //           .get(ApiConfig.resourcesList, queryParameters: queryParameters),
  //       ResourceModel.fromJson);
  // }
  @override
  Future<List<ResourceModel>> getResourcesList() async {
    return await makeGetRequest(
        dioClient.dio.get(
          ApiConfig.resourcesList,
        ),
        ResourceModel.fromJson);
  }

  @override
  Future<List<ResourceModel>> getResource(ResourceModel resource) {
    // TODO: implement getResource
    throw UnimplementedError();
  }
}
