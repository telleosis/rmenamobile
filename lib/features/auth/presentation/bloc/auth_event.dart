// Define Events
abstract class AuthEvent {}

class TogglePasswordVisibility extends AuthEvent {}

// Define States
class AuthState {
  final bool isPasswordHidden;
  AuthState({required this.isPasswordHidden});
}
