import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GeneratedImagePage extends StatelessWidget {
  const GeneratedImagePage({Key? key, required this.myBytes}) : super(key: key);

  final Uint8List myBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Generated Image")),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.memory(myBytes)
            ],
          ),
        ),
      ),
    );
  }
}
