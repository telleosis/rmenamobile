import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rhema_mena_student_app/common/network/dio_client.dart';
import 'package:rhema_mena_student_app/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:rhema_mena_student_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:rhema_mena_student_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/update_password_usecase.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:rhema_mena_student_app/features/course/data/datasources/course_remote_data_sources.dart';
import 'package:rhema_mena_student_app/features/course/data/repositories/course_repository_impl.dart';
import 'package:rhema_mena_student_app/features/course/domain/repositories/course_repository.dart';
import 'package:rhema_mena_student_app/features/course/domain/usecases/get_course_list_usecase.dart';
import 'package:rhema_mena_student_app/features/course/presentation/bloc/course_bloc.dart';
import 'package:rhema_mena_student_app/features/resources/data/datasources/resources_remote_data_sources.dart';
import 'package:rhema_mena_student_app/features/resources/data/repositories/resources_repository_impl.dart';
import 'package:rhema_mena_student_app/features/resources/domain/repositories/resources_repository.dart';
import 'package:rhema_mena_student_app/features/resources/domain/usecases/get_resources_list_usecase.dart';
import 'package:rhema_mena_student_app/features/resources/presentation/bloc/resources_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// Blocs
  /// AuthBloc
  getIt.registerFactory(
    () => AuthBloc(
      loginUseCase: getIt<LoginUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
      forgotPasswordUseCase: getIt<ForgotPasswordUseCase>(),
      updatePasswordUseCase: getIt<UpdatePasswordUseCase>(),
      resetPasswordUseCase: getIt<ResetPasswordUseCase>(),
      getUserUseCase: getIt<GetUserUseCase>(),
    ),
  );

  /// Courses Blocs
  getIt.registerFactory(
    () => CourseBloc(
      getCourseListUseCase: getIt<GetCourseListUseCase>(),
    ),
  );

  /// Resources Blocs
  getIt.registerFactory(
    () => ResourceBloc(
      getResourceListUseCase: getIt<GetResourceListUseCase>(),
    ),
  );

  /// Use Cases
  // Auth Use cases
  getIt.registerLazySingleton(() => LoginUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(
      () => ForgotPasswordUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(
      () => UpdatePasswordUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(
      () => ResetPasswordUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => GetUserUseCase(getIt<AuthRepository>()));

  /// Courses Use cases
  getIt.registerLazySingleton(
      () => GetCourseListUseCase(getIt<CourseRepository>()));

  /// Resources Use Cases
  getIt.registerLazySingleton(
      () => GetResourceListUseCase(getIt<ResourcesRepository>()));

  /// Repositories
  // Auth repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: getIt()),
  );
  // Courses repository
  getIt.registerLazySingleton<CourseRepository>(
    () => CourseRepositoryImpl(remoteDataSource: getIt()),
  );
  // Resources repository
  getIt.registerLazySingleton<ResourcesRepository>(
    () => ResourcesRepositoryImpl(remoteDataSource: getIt()),
  );

  /// Remote Data Sources
  // Auth remote data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  // Courses remote data sources
  getIt.registerLazySingleton<CourseRemoteDataSource>(
      () => CourseRemoteDataSourceImpl());
  // Resources remote data sources
  getIt.registerLazySingleton<ResourcesRemoteDataSource>(
      () => ResourcesRemoteDataSourceImpl());

  //Dio
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<Dio>(() => Dio());
}
