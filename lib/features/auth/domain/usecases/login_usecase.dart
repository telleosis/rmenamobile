import 'package:rhema_mena_student_app/common/usecase/usecase.dart';
import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<bool, LoginUserParams> {
  final AuthRepository authRepository;

  const LoginUseCase(this.authRepository);

  @override
  Future<ApiResult<bool>> call(LoginUserParams params) async {
    return await authRepository.login(params.auth);
  }
}

class LoginUserParams {
  // final String email;
  // final String password; //Note - may change this to User later
  final Auth auth;

  const LoginUserParams(this.auth);
  // const LoginUserParams(this.email, this.password);
}
