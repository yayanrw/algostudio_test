import 'package:algostudio_test/domain/entities/meme.dart';
import 'package:algostudio_test/presentation/widgets/my_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.meme}) : super(key: key);

  final Meme meme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meme.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [MyImage(meme: meme)],
        ),
      ),
    );
  }
}
