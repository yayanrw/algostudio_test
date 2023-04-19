import 'package:algostudio_test/core/utils/errors/failure.dart';
import 'package:algostudio_test/domain/entities/meme.dart';
import 'package:algostudio_test/domain/repositories/meme_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetMemes {
  final MemeRepository memeRepository;

  GetMemes(this.memeRepository);

  Future<Either<Failure, List<Meme>>> call() async {
    return await memeRepository.getMemes();
  }
}
