import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/features/resources/data/models/resource_model.dart';

abstract class ResourcesRepository {
  Future<ApiResult<List<ResourceModel>>>
      getResourcesList(); //getResourcesList({String? id, String? name})

  Future<ApiResult<List<ResourceModel>>> getResource(ResourceModel resource);
}
