import 'dart:io';

import 'package:algostudio_test/core/utils/errors/exceptions.dart';
import 'package:algostudio_test/core/utils/errors/failure.dart';
import 'package:algostudio_test/data/datasources/remote/remote_datasource.dart';
import 'package:algostudio_test/domain/entities/meme.dart';
import 'package:algostudio_test/domain/repositories/meme_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MemeRepository)
class MemeRepositoryImpl implements MemeRepository {
  final RemoteDataSource remoteDataSource;

  MemeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Meme>>> getMemes() async {
    try {
      final result = await remoteDataSource.fetchMemes();

      if (result.success) {
        return Right(result.data.memes.map((e) => e.toEntity()).toList());
      } else {
        return const Left(ApplicationFailure("Error"));
      }
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }
}
