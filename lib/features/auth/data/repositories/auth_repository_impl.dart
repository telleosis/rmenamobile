import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/common/repository/repository_helper.dart';
import 'package:rhema_mena_student_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:rhema_mena_student_app/features/auth/data/datasources/auth_remote_data_sources.dart';

class AuthRepositoryImpl extends AuthRepository
    with RepositoryHelper<AuthRemoteDataSource> {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<bool>> login(Auth auth) {
    return checkItemFailOrSuccess(remoteDataSource.login(auth));
  }

  @override
  Future<ApiResult<bool>> logout(Auth auth) {
    return checkItemFailOrSuccess(remoteDataSource.logout(auth));
  }

  @override
  Future<ApiResult<bool>> forgotPassword(Auth auth) async {
    return checkItemFailOrSuccess(remoteDataSource.forgotPassword(auth));
  }

  @override
  Future<ApiResult<bool>> updatePassword(Auth auth) async {
    return checkItemFailOrSuccess(remoteDataSource.updatePassword(auth));
  }

  @override
  Future<ApiResult<bool>> resetPassword(Auth auth) {
    return checkItemFailOrSuccess(remoteDataSource.resetPassword(auth));
  }

  @override
  Future<ApiResult<Auth>> getUserProfile({required Auth auth}) {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }
}
