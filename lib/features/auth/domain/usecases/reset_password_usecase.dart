import 'package:rhema_mena_student_app/common/usecase/usecase.dart';
import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase implements UseCase<bool, PasswordResetParams> {
  final AuthRepository authRepository;

  const ResetPasswordUseCase(this.authRepository);

  @override
  Future<ApiResult<bool>> call(PasswordResetParams params) async {
    return await authRepository.resetPassword(params.auth);
  }
}

class PasswordResetParams {
  final Auth auth;

  const PasswordResetParams(this.auth);
}
