import 'package:algostudio_test/data/datasources/remote/dtos/meme_dto.dart';

class Meme {
  Meme({
    required this.id,
    required this.name,
    required this.url,
  });

  final String id;
  final String name;
  final String url;
}

extension MemeDtoExtension on MemeDto {
  Meme toEntity() {
    return Meme(
      id: id,
      name: name,
      url: url,
    );
  }
}
