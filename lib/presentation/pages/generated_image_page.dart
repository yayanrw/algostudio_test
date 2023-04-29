import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

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
              Expanded(
                child: Image.memory(myBytes),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.save),
                    onPressed: () async {
                      final result = await ImageGallerySaver.saveImage(myBytes);
                      if (result['isSuccess']) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Image saved to gallery!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {
                      // Add logic for sharing the image on Facebook here
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // Add logic for sharing the image on Twitter here
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
