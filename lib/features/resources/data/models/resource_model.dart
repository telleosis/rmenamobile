import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:rhema_mena_student_app/features/resources/domain/entities/resource_entity.dart';

part 'resource_model.g.dart';

@immutable
@JsonSerializable()
class ResourceModel extends ResourceEntity {
  const ResourceModel({
    required super.avatar,
    required super.id,
    required super.url,
    required super.name,
  });

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return ResourceModel(
      avatar: json["avatar"] ?? "",
      id: json["id"] ?? "",
      url: json["url"] ?? "",
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "id": id,
        "url": url,
        "name": name,
      };
}
