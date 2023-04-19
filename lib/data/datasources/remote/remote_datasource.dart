import 'dart:convert';

import 'package:algostudio_test/core/config/constants.dart';
import 'package:algostudio_test/core/utils/errors/exceptions.dart';
import 'package:algostudio_test/data/datasources/remote/responses/memes_response.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl(this.client);

  @override
  Future<MemesResponse> fetchMemes() async {
    final response = await client.get(Uri.parse('${baseUrl}get_memes'));

    if (response.statusCode == 200) {
      final MemesResponse memesResponse =
          MemesResponse.fromJson(jsonDecode(response.body));
      return memesResponse;
    } else {
      throw ServerException();
    }
  }
}

abstract class RemoteDataSource {
  Future<MemesResponse> fetchMemes();
}
