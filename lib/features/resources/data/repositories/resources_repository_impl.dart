import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/common/repository/repository_helper.dart';
import 'package:rhema_mena_student_app/features/resources/data/datasources/resources_remote_data_sources.dart';
import 'package:rhema_mena_student_app/features/resources/data/models/resource_model.dart';
import 'package:rhema_mena_student_app/features/resources/domain/repositories/resources_repository.dart';

class ResourcesRepositoryImpl extends ResourcesRepository
    with RepositoryHelper<ResourceModel> {
  final ResourcesRemoteDataSource remoteDataSource;

  ResourcesRepositoryImpl({required this.remoteDataSource});

  // @override
  // Future<ApiResult<List<ResourceModel>>> getResourcesList(
  //     {String? id, String? name}) async {
  //   return checkItemsFailOrSuccess(
  //       remoteDataSource.getResourcesList(id: id, name: name));
  // }

  @override
  Future<ApiResult<List<ResourceModel>>> getResourcesList() async {
    return checkItemsFailOrSuccess(remoteDataSource.getResourcesList());
  }

  @override
  Future<ApiResult<List<ResourceModel>>> getResource(ResourceModel resource) {
    return checkItemsFailOrSuccess(remoteDataSource.getResource(resource));
  }
}
