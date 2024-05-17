import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/common/usecase/usecase.dart';
import 'package:rhema_mena_student_app/features/resources/data/models/resource_model.dart';
import 'package:rhema_mena_student_app/features/resources/domain/repositories/resources_repository.dart';

class GetResourceListUseCase
    implements UseCase<List<ResourceModel>, GetResourceParams> {
  final ResourcesRepository resourcesRepository;

  const GetResourceListUseCase(this.resourcesRepository);

  // @override
  // Future<ApiResult<List<ResourceModel>>> call(GetResourceParams params) async {
  //   return await resourcesRepository.getResourcesList(
  //       id: params.id, name: params.name);
  // }
  @override
  Future<ApiResult<List<ResourceModel>>> call(GetResourceParams params) async {
    return await resourcesRepository.getResourcesList();
  }
}

class GetResourceParams {
  // final String? id;
  // final String? name;

  const GetResourceParams(); //const GetResourceParams({this.id, this.name});
}
