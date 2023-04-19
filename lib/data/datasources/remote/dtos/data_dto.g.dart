// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDto _$DataDtoFromJson(Map<String, dynamic> json) => DataDto(
      memes: (json['memes'] as List<dynamic>)
          .map((e) => MemeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataDtoToJson(DataDto instance) => <String, dynamic>{
      'memes': instance.memes,
    };
