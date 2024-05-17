import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'course_model.g.dart';

@immutable
@JsonSerializable()
class CourseModel {
  final String avatar;
  final List<Resource> resources;
  final Assignments? assignments;
  final String id;
  final String level;
  final String title;

  const CourseModel({
    required this.avatar,
    required this.resources,
    required this.assignments,
    required this.id,
    required this.level,
    required this.title,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      avatar: json["avatar"] ?? "",
      resources: json["resources"] != null
          ? List<Resource>.from(
              json["resources"].map((x) => Resource.fromJson(x)))
          : [],
      assignments: json["assignments"] != null
          ? Assignments.fromJson(json['assignments'])
          : null,
      id: json["id"] ?? 0,
      level: json["level"] ?? 0,
      title: json["title"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "resources": List<dynamic>.from(resources.map((x) => x.toJson())),
        "assignments": assignments?.toJson(),
        "id": id,
        "level": level,
        "title": title,
      };
}

class Assignments {
  final Map<String, String>? assignments;

  Assignments({
    required this.assignments,
  });

  factory Assignments.fromJson(Map<String, dynamic> assignments) {
    return Assignments(
      assignments: Map<String, String>.from(assignments),
    );
  }

  Map<String, dynamic> toJson() => {
        "assignments": Map.from(assignments!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Resource {
  final String name;
  final String url;

  Resource({
    required this.name,
    required this.url,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
