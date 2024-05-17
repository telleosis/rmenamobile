import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/common/usecase/usecase.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/features/auth/domain/repositories/auth_repository.dart';

class GetUserUseCase implements UseCase<Auth, GetUserParams> {
  final AuthRepository authRepository;

  const GetUserUseCase(this.authRepository);

  @override
  Future<ApiResult<Auth>> call(GetUserParams params) async {
    return await authRepository.getUserProfile(auth: params.auth);
  }
}

class GetUserParams {
//   final String? firstName;
//   final UserRole? role;
//   final UserStatus? status;
  final Auth auth;

  const GetUserParams({required this.auth});
}
