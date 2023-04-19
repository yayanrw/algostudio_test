// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemeDto _$MemeDtoFromJson(Map<String, dynamic> json) => MemeDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      boxCount: json['boxCount'] as int?,
      captions: json['captions'] as int?,
    );

Map<String, dynamic> _$MemeDtoToJson(MemeDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'boxCount': instance.boxCount,
      'captions': instance.captions,
    };
