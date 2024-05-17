import 'package:flutter/foundation.dart' show immutable;

@immutable
class CourseEntity {
  final String avatar;
  final List<ResourceEntity> resources;
  final AssignmentsEntity assignments;
  final String id;
  final String level;
  final String title;

  const CourseEntity({
    required this.avatar,
    required this.resources,
    required this.assignments,
    required this.id,
    required this.level,
    required this.title,
  });
}

@immutable
class AssignmentsEntity {
  final Map<String, String> assignments;

  const AssignmentsEntity({
    required this.assignments,
  });
}

@immutable
class ResourceEntity {
  final String name;
  final String url;

  const ResourceEntity({
    required this.name,
    required this.url,
  });
}
