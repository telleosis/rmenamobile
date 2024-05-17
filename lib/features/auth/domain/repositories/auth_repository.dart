import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';

abstract class AuthRepository {
  // Future<ApiResult<List<Auth>>> getUser(User user);

  Future<ApiResult<bool>> login(Auth auth);

  //  Future<ApiResult<bool>> login(
  //   String email,
  //   String password,
  // );

  Future<ApiResult<bool>> logout(Auth auth);

  Future<ApiResult<bool>> forgotPassword(Auth auth);

  Future<ApiResult<bool>> updatePassword(Auth auth);

  Future<ApiResult<bool>> resetPassword(Auth auth);

  Future<ApiResult<Auth>> getUserProfile({required Auth auth});
}
