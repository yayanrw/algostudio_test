import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

class Utils {
  static capture(GlobalKey? key) async {
    if (key == null) return null;

    RenderRepaintBoundary boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData?.buffer.asUint8List();

    return pngBytes;
  }
}
