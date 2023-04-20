import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DetailNotifier extends ChangeNotifier {
  List<String> _addedText = [];

  List<String> get addedText => _addedText;

  void addText(String text) {
    _addedText.add(text);
    notifyListeners();
  }
}
