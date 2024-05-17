import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart' show immutable, kDebugMode;
import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/common/bloc/generic_bloc_state.dart';
import 'package:rhema_mena_student_app/features/resources/data/models/resource_model.dart';
import 'package:rhema_mena_student_app/features/resources/presentation/bloc/resources_event.dart';
import 'package:rhema_mena_student_app/features/resources/domain/usecases/get_resources_list_usecase.dart';

@immutable
class ResourceBloc {
  factory ResourceBloc({
    required getResourceListUseCase,
  }) {
    final BehaviorSubject<ResourcesListFetched> refreshResourceList =
        BehaviorSubject<ResourcesListFetched>();

    final Stream<GenericBlocState<ResourceModel>> resourceList =
        refreshResourceList.switchMap(
      (ResourcesListFetched input) {
        return Rx.fromCallable<ApiResult<List<ResourceModel>>>(
          () async => await getResourceListUseCase.call(
            const GetResourceParams(), //GetResourceParams(id: input.id, name: input.name)
          ),
        ).asyncMap<GenericBlocState<ResourceModel>>((result) {
          return result.when(
            success: (List<ResourceModel> items) async {
              if (items.isEmpty) {
                return GenericBlocState.empty();
              } else {
                return GenericBlocState.success(items);
              }
            },
            failure: (String failure) async {
              return GenericBlocState.failure(failure);
            },
          );
        });
      },
    ).startWith(GenericBlocState.loading());

    return ResourceBloc._(
      getResourceListUseCase: getResourceListUseCase,
      refreshResourceList: refreshResourceList,
      resourceList: resourceList,
    );
  }

  //Use cases
  final GetResourceListUseCase getResourceListUseCase;

  // read-only properties
  final Stream<GenericBlocState<ResourceModel>> resourceList;

// write-only properties
  final Sink<ResourcesListFetched> refreshResourceList;

  //Private constructor
  const ResourceBloc._({
    required this.getResourceListUseCase,
    required this.resourceList,
    required this.refreshResourceList,
  });

  void dispose() {
    refreshResourceList.close();
  }
}
