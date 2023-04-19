// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemesResponse _$MemesResponseFromJson(Map<String, dynamic> json) =>
    MemesResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : DataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MemesResponseToJson(MemesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
