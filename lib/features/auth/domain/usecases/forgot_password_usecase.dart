import 'package:rhema_mena_student_app/common/usecase/usecase.dart';
import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUseCase implements UseCase<bool, ForgotPasswordParams> {
  final AuthRepository authRepository;

  const ForgotPasswordUseCase(this.authRepository);

  @override
  Future<ApiResult<bool>> call(ForgotPasswordParams params) async {
    return await authRepository.forgotPassword(params.auth);
  }
}

class ForgotPasswordParams {
  final Auth auth;

  const ForgotPasswordParams(this.auth);
}
