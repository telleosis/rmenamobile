import 'package:flutter/foundation.dart' show immutable;

@immutable
class ResourceEntity {
  final String? avatar;
  final String? id;
  final String? url;
  final String? name;

  const ResourceEntity({
    required this.avatar,
    required this.id,
    required this.url,
    required this.name,
  });
}
