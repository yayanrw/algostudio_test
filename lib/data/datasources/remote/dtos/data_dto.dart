import 'package:algostudio_test/data/datasources/remote/dtos/meme_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_dto.g.dart';

@JsonSerializable()
class Data {
  Data({
    this.memes,
  });

  List<MemeDto>? memes;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
