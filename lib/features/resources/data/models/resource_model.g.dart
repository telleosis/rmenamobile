// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceModel _$ResourceModelFromJson(Map<String, dynamic> json) =>
    ResourceModel(
      avatar: json['avatar'] as String?,
      id: json['id'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ResourceModelToJson(ResourceModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
    };
