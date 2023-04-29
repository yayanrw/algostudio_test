import 'dart:io';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

@RoutePage()
class GeneratedImagePage extends StatelessWidget {
  const GeneratedImagePage({Key? key, required this.myBytes}) : super(key: key);

  final Uint8List myBytes;

  Future<void> shareToOthers(Uint8List imageBytes) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/image.jpg');
    await tempFile.writeAsBytes(imageBytes);
    await Share.shareFiles(
      [tempFile.path],
      text: 'Check out this image!',
      mimeTypes: ['image/jpeg'],
      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
    );
    await tempFile.delete();
  }


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
                    icon: const Icon(Icons.save),
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
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      shareToOthers(myBytes);
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
