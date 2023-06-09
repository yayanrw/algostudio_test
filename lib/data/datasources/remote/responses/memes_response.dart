import 'package:algostudio_test/data/datasources/remote/dtos/data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'memes_response.g.dart';

@JsonSerializable()
class MemesResponse {
  MemesResponse({
    required this.success,
    required this.data,
  });

  bool success;
  DataDto data;

  factory MemesResponse.fromJson(Map<String, dynamic> json) =>
      _$MemesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MemesResponseToJson(this);
}
