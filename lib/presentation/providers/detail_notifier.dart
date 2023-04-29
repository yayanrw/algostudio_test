import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DetailNotifier extends ChangeNotifier {
  List<String> _addedText = [];

  List<String> get addedText => _addedText;

  List<Offset> _offsetsText = [];

  List<Offset> get offsetsText => _offsetsText;

  List<File> _addedImage = [];

  List<File> get addedImage => _addedImage;

  List<Offset> _offsetsImage = [];

  List<Offset> get offsetsImage => _offsetsImage;

  void addText(String text) {
    _addedText.add(text);
    _offsetsText.add(const Offset(0.0, 0.0));
    notifyListeners();
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _addedImage.add(File(pickedFile.path));
      _offsetsImage.add(const Offset(0.0, 0.0));
      notifyListeners();
    }
    debugPrint('anjing$_addedImage');
  }

  void reset() {
    _addedText.clear();
    _addedImage.clear();
  }

  void updateOffsetText(int index, DragUpdateDetails value) {
    _offsetsText[index] = Offset(
      _offsetsText[index].dx + value.delta.dx,
      _offsetsText[index].dy + value.delta.dy,
    );
    notifyListeners();
  }

  void updateOffsetImage(int index, DragUpdateDetails value) {
    _offsetsImage[index] = Offset(
      _offsetsImage[index].dx + value.delta.dx,
      _offsetsImage[index].dy + value.delta.dy,
    );
    notifyListeners();
  }
}
