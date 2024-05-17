import 'package:rhema_mena_student_app/di.dart';
import 'package:rhema_mena_student_app/common/network/api_config.dart';
import 'package:rhema_mena_student_app/common/network/api_helper.dart';
import 'package:rhema_mena_student_app/common/network/dio_client.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/features/auth/domain/entities/auth_entity.dart';
//import 'package:rhema_mena_student_app/features/user/data/models/user.dart';

abstract class AuthRemoteDataSource {
  Future<bool> login(Auth auth);
  Future<bool> logout(Auth auth);
  Future<bool> forgotPassword(Auth auth);
  Future<bool> updatePassword(Auth auth);
  Future<bool> resetPassword(Auth auth);
  Future<Auth> getUserProfile(
      {String? firstName,
      UserRole? role,
      UserStatus? status,
      required Auth auth});
}

class AuthRemoteDataSourceImpl
    with ApiHelper<Auth>
    implements AuthRemoteDataSource {
  final DioClient dioClient = getIt<DioClient>();

  @override
  Future<bool> login(Auth auth) async {
    return await makePostRequest(
        dioClient.dio.post(ApiConfig.login, data: auth));
  }

  @override
  Future<bool> logout(Auth auth) async {
    final queryParameters = {'user_email': auth.email};

    return await makePostRequest(
      dioClient.dio
          .post(ApiConfig.logout, data: auth, queryParameters: queryParameters),
    );
  }

  @override
  Future<bool> forgotPassword(Auth auth) async {
    return await makePostRequest(
        dioClient.dio.post(ApiConfig.forgotPassword, data: auth));
  }

  @override
  Future<bool> updatePassword(Auth auth) async {
    return await makePostRequest(
        dioClient.dio.patch(ApiConfig.updatePassword, data: auth));
  }

  @override
  Future<bool> resetPassword(Auth auth) async {
    return await makePostRequest(dioClient.dio
        .post("${ApiConfig.resetPassword}/${auth.email}", data: auth));
  }

  @override
  Future<Auth> getUserProfile(
      {String? firstName,
      UserRole? role,
      UserStatus? status,
      required Auth auth}) {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  // @override
  // Future<Auth> getUserProfile(
  //     {String? firstName, UserRole? role, UserStatus? status}) async {
  //   if (firstName == null && role == null) {
  //     throw ArgumentError('Either firstname must be provided');
  //   }

  //   Map<String, dynamic> queryParameters = <String, dynamic>{};
  //   if (firstName != null) {
  //     queryParameters['firstName'] = firstName;
  //   }
  //   if (role != null) {
  //     queryParameters['role'] = role;
  //   }

  //   try {
  //     final response = await makeGetRequest(
  //         dioClient.dio.get(ApiConfig.user, queryParameters: queryParameters),
  //         Auth.fromJson);
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
