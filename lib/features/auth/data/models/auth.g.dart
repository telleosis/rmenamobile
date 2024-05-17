// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      id: json['id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      title: json['title'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      studentId: (json['studentId'] as num).toInt(),
      isVerified: json['isVerified'] as bool,
      avatar: json['avatar'] as String,
      status: $enumDecode(_$UserStatusEnumMap, json['status']),
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'phone': instance.phone,
      'studentId': instance.studentId,
      'isVerified': instance.isVerified,
      'avatar': instance.avatar,
      'role': _$UserRoleEnumMap[instance.role]!,
      'status': _$UserStatusEnumMap[instance.status]!,
    };

const _$UserStatusEnumMap = {
  UserStatus.granted: 'granted',
  UserStatus.denied: 'denied',
};

const _$UserRoleEnumMap = {
  UserRole.prospectiveStudent: 'prospectiveStudent',
  UserRole.student: 'student',
  UserRole.alumni: 'alumni',
  UserRole.superAdmin: 'superAdmin',
  UserRole.instructor: 'instructor',
  UserRole.partner: 'partner',
  UserRole.curriculumDeveloper: 'curriculumDeveloper',
  UserRole.countryDirector: 'countryDirector',
  UserRole.campusAdministrator: 'campusAdministrator',
  UserRole.instructorAdministrator: 'instructorAdministrator',
  UserRole.campusCoordinator: 'campusCoordinator',
};
