import 'package:rhema_mena_student_app/features/course/domain/usecases/get_course_list_usecase.dart';
import 'package:rhema_mena_student_app/features/course/presentation/bloc/course_event.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/common/bloc/generic_bloc_state.dart';
import 'package:rhema_mena_student_app/features/course/data/models/course_model.dart';

@immutable
class CourseBloc {
  factory CourseBloc({
    //required getClassEventUseCase,
    required getCourseListUseCase,
  }) {
    final BehaviorSubject<CourseListFetched> refreshCourseList =
        BehaviorSubject<CourseListFetched>();

    //final BehaviorSubject<Class> getClass = BehaviorSubject<Class>();

    final Stream<GenericBlocState<CourseModel>> courseList =
        refreshCourseList.switchMap(
      (CourseListFetched input) {
        return Rx.fromCallable<ApiResult<List<CourseModel>>>(
          () async => await getCourseListUseCase.call(
            GetCourseParams(level: input.level, resource: input.resource),
          ),
        ).asyncMap<GenericBlocState<CourseModel>>((result) {
          return result.when(
            success: (List<CourseModel> items) async {
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

    return CourseBloc._(
      getCourseListUseCase: getCourseListUseCase,
      refereshCourseList: refreshCourseList,
      courseList: courseList,
      // getClassEventUseCase: getClassEventUseCase,
    );
  }

  //Use cases
  final GetCourseListUseCase getCourseListUseCase;
  // final GetClassEventUseCase getClassEventUseCase;

  // read-only properties
  final Stream<GenericBlocState<CourseModel>> courseList;
  //final Stream<GenericBlocState<Class>> classEvent;

// write-only properties
  final Sink<CourseListFetched> refereshCourseList;

  //Private constructor
  const CourseBloc._({
    required this.getCourseListUseCase,
    required this.courseList,
    required this.refereshCourseList,
  });

  void dispose() {
    refereshCourseList.close();
  }
}
