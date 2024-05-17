// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      avatar: json['avatar'] as String,
      resources: (json['resources'] as List<dynamic>)
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignments: json['assignments'] == null
          ? null
          : Assignments.fromJson(json['assignments'] as Map<String, dynamic>),
      id: json['id'] as String,
      level: json['level'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'resources': instance.resources,
      'assignments': instance.assignments,
      'id': instance.id,
      'level': instance.level,
      'title': instance.title,
    };
