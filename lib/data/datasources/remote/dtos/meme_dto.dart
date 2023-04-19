
import 'package:json_annotation/json_annotation.dart';

part 'meme_dto.g.dart';

@JsonSerializable()
class MemeDto {
  MemeDto({
    required this.id,
    required this.name,
    required this.url,
    this.width,
    this.height,
    this.boxCount,
    this.captions,
  });

  String id;
  String name;
  String url;
  int? width;
  int? height;
  int? boxCount;
  int? captions;

  factory MemeDto.fromJson(Map<String, dynamic> json) => _$MemeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MemeDtoToJson(this);
}