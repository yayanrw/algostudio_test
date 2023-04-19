import 'package:algostudio_test/core/utils/errors/failure.dart';
import 'package:algostudio_test/core/utils/request_state.dart';
import 'package:algostudio_test/domain/entities/meme.dart';
import 'package:algostudio_test/domain/usecases/get_memes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MemesNotifier extends ChangeNotifier {
  final GetMemes getMemes;

  MemesNotifier(this.getMemes);

  String _message = '';

  String get message => _message;

  RequestState _requestState = RequestState.empty;

  RequestState get requestState => _requestState;

  List<Meme> _memes = <Meme>[];

  List<Meme> get memes => _memes;

  Future<void> fetchMemes() async {
    _requestState = RequestState.loading;
    notifyListeners();

    final Either<Failure, List<Meme>> result = await getMemes.call();

    result.fold((Failure failure) {
      _requestState = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (List<Meme> success) {
      _requestState = RequestState.loaded;
      _memes = success;
      notifyListeners();
    });
  }
}
