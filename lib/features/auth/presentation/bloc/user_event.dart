import 'package:flutter/foundation.dart' show immutable;
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';

@immutable
class DisplayUser {
  final Auth auth;

  const DisplayUser(this.auth);
}
