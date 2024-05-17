import 'package:rhema_mena_student_app/common/usecase/usecase.dart';
import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/features/auth/domain/repositories/auth_repository.dart';

class UpdatePasswordUseCase implements UseCase<bool, UpdatePasswordParams> {
  final AuthRepository authRepository;

  const UpdatePasswordUseCase(this.authRepository);

  @override
  Future<ApiResult<bool>> call(UpdatePasswordParams params) async {
    return await authRepository.updatePassword(params.auth);
  }
}

class UpdatePasswordParams {
  final Auth auth;

  const UpdatePasswordParams(this.auth);
}
