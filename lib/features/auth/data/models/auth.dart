import 'package:rhema_mena_student_app/features/auth/domain/entities/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'auth.g.dart';

@immutable
@JsonSerializable()
class Auth extends AuthEntity {
  const Auth({
    required super.id,
    required super.email,
    required super.password,
    required super.title,
    required super.lastName,
    required super.firstName,
    required super.gender,
    required super.phone,
    required super.studentId,
    required super.isVerified,
    required super.avatar,
    required super.status,
    required super.role,
    //@JsonKey(name: "role") required super.role, required String name, required String token, required String roleName,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
