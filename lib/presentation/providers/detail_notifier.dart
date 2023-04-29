import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DetailNotifier extends ChangeNotifier {
  List<String> _addedText = [];

  List<String> get addedText => _addedText;

  List<Offset> _offsets = [];

  List<Offset> get offsets => _offsets;

  void addText(String text) {
    _addedText.add(text);
    _offsets.add(const Offset(0.0, 0.0));
    notifyListeners();
  }

  void resetAddedText() {
    _addedText.clear();
  }

  void updateOffset(int index, DragUpdateDetails value) {
    _offsets[index] = Offset(
      _offsets[index].dx + value.delta.dx,
      _offsets[index].dy + value.delta.dy,
    );
    notifyListeners();
  }
}
