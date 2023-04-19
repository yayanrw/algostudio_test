import 'package:algostudio_test/core/config/constants.dart';
import 'package:algostudio_test/domain/entities/meme.dart';
import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({Key? key, required this.meme}) : super(key: key);

  final Meme meme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Center(
        child: Image.network(meme.url),
      ),
    );
  }
}
