import 'package:rhema_mena_student_app/common/usecase/usecase.dart';
import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<bool, LogoutUserParams> {
  final AuthRepository authRepository;

  const LogoutUseCase(this.authRepository);

  @override
  Future<ApiResult<bool>> call(LogoutUserParams params) async {
    return await authRepository.logout(params.auth);
  }
}

class LogoutUserParams {
  final Auth auth; //Note - may change this to User later

  const LogoutUserParams(this.auth);
}
