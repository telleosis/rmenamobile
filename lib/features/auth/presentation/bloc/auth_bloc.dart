import 'package:rhema_mena_student_app/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/bloc/user_event.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhema_mena_student_app/common/network/api_result.dart';
import 'package:rhema_mena_student_app/common/bloc/generic_bloc_state.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:rhema_mena_student_app/features/auth/domain/usecases/update_password_usecase.dart';

@immutable
class AuthBloc {
  factory AuthBloc({
    required loginUseCase,
    required logoutUseCase,
    required forgotPasswordUseCase,
    required updatePasswordUseCase,
    required resetPasswordUseCase,
    required getUserUseCase,
  }) {
    final BehaviorSubject<Auth> loginUser = BehaviorSubject<Auth>();
    final BehaviorSubject<Auth> logoutUser = BehaviorSubject<Auth>();
    final BehaviorSubject<Auth> forgotPassword = BehaviorSubject<Auth>();
    final BehaviorSubject<Auth> updatePassword = BehaviorSubject<Auth>();
    final BehaviorSubject<Auth> resetPassword = BehaviorSubject<Auth>();
    final BehaviorSubject<DisplayUser> user = BehaviorSubject<DisplayUser>();

    //Define Funcitons
    final isUserLoggedIn = loginUser.flatMap(
      (auth) {
        return Rx.fromCallable<ApiResult<bool>>(
          () {
            return loginUseCase.call(LoginUserParams(auth));
          },
        ); // Return Stream<ApiResult<bool>>
      },
    ).asyncMap<GenericBlocState<bool>>(
      (result) {
        return result.when(
          success: (_) async {
            return GenericBlocState.success(null);
          },
          failure: (String failure) async {
            return GenericBlocState.failure(failure);
          },
        );
      },
    );

    final isUserLoggedOut = logoutUser.flatMap(
      (auth) {
        return Rx.fromCallable<ApiResult<bool>>(
          () {
            return logoutUseCase.call(LogoutUserParams(auth));
          },
        ); // Return Stream<ApiResult<bool>>
      },
    ).asyncMap<GenericBlocState<bool>>(
      (result) {
        return result.when(
          success: (_) async {
            return GenericBlocState.success(null);
          },
          failure: (String failure) async {
            return GenericBlocState.failure(failure);
          },
        );
      },
    );

    final Stream<GenericBlocState<Auth>> displayUser = user.switchMap(
      (DisplayUser input) {
        return Rx.fromCallable<ApiResult<List<Auth>>>(
          () async => await getUserUseCase.call(
              //GetUserParams(id: input.id, email: input.email),
              GetUserParams(auth: input.auth)),
        ).asyncMap<GenericBlocState<Auth>>((result) {
          return result.when(
            success: (List<Auth> item) async {
              if (item.isEmpty) {
                return GenericBlocState.empty();
              } else {
                return GenericBlocState.success(item);
              }
            },
            failure: (String failure) async {
              return GenericBlocState.failure(failure);
            },
          );
        });
      },
    ).startWith(GenericBlocState.loading());

    return AuthBloc._(
      loginUseCase: loginUseCase,
      logoutUseCase: logoutUseCase,
      forgotPasswordUseCase: forgotPasswordUseCase,
      updatePasswordUseCase: updatePasswordUseCase,
      resetPasswordUseCase: resetPasswordUseCase,
      loginUser: loginUser,
      logoutUser: logoutUser,
      forgotPassword: forgotPassword,
      updatePassword: updatePassword,
      resetPassword: resetPassword,
      isUserloggedIn: isUserLoggedIn,
      isUserLoggedOut: isUserLoggedOut,
      getUserUseCase: getUserUseCase,
      userList: displayUser,
    );
  }

  // Use cases
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final GetUserUseCase getUserUseCase;

  // Read-only properties
  final Stream<GenericBlocState<bool>> isUserloggedIn;
  final Stream<GenericBlocState<bool>> isUserLoggedOut;
  final Stream<GenericBlocState<Auth>> userList;

  // Write-only properties
  final Sink<Auth> loginUser;
  final Sink<Auth> logoutUser;
  final Sink<Auth> resetPassword;
  final Sink<Auth> updatePassword;
  final Sink<Auth> forgotPassword;

  // Private constructor
  const AuthBloc._({
    required this.loginUser,
    required this.logoutUser,
    required this.resetPassword,
    required this.updatePassword,
    required this.forgotPassword,
    required this.loginUseCase,
    required this.forgotPasswordUseCase,
    required this.updatePasswordUseCase,
    required this.resetPasswordUseCase,
    required this.isUserloggedIn,
    required this.logoutUseCase,
    required this.isUserLoggedOut,
    required this.getUserUseCase,
    required this.userList,
  });

  // Method to dispose the streams
  void dispose() {
    loginUser.close();
    logoutUser.close();
    forgotPassword.close();
    updatePassword.close();
    resetPassword.close();
    updatePassword.close();
  }
}

class PasswordToggleBloc extends Bloc<AuthEvent, AuthState> {
  PasswordToggleBloc() : super(AuthState(isPasswordHidden: true)) {
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
  }

  void _togglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<AuthState> emit,
  ) {
    // Toggle the password visibility and emit the new state
    emit(AuthState(isPasswordHidden: !state.isPasswordHidden));
  }
}
