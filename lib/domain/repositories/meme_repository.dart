import 'package:algostudio_test/core/utils/errors/failure.dart';
import 'package:algostudio_test/domain/entities/meme.dart';
import 'package:dartz/dartz.dart';

abstract class MemeRepository {
  Future<Either<Failure, List<Meme>>> getMemes();
}
