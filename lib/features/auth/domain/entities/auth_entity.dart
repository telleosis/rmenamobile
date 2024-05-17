import 'package:flutter/foundation.dart' show immutable;

@immutable
class AuthEntity {
  const AuthEntity(
      {required this.id,
      required this.title,
      required this.lastName,
      required this.firstName,
      required this.email,
      required this.password,
      required this.gender,
      required this.phone,
      required this.studentId,
      required this.isVerified,
      required this.avatar,
      required this.role,
      required this.status});

  final String id;
  final String title;
  final String lastName;
  final String firstName;
  final String email;
  final String password;
  final String gender;
  final String phone;
  final int studentId;
  final bool isVerified;
  final String avatar;
  final UserRole role;
  final UserStatus status;
}

enum UserRole {
  prospectiveStudent,
  student,
  alumni,
  superAdmin,
  instructor,
  partner,
  curriculumDeveloper,
  countryDirector,
  campusAdministrator,
  instructorAdministrator,
  campusCoordinator
}

enum UserStatus { granted, denied }
