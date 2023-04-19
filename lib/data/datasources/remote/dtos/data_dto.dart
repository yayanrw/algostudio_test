import 'package:algostudio_test/data/datasources/remote/dtos/meme_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_dto.g.dart';

@JsonSerializable()
class DataDto {
  DataDto({
    this.memes,
  });

  List<MemeDto>? memes;

  factory DataDto.fromJson(Map<String, dynamic> json) => _$DataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataDtoToJson(this);
}
