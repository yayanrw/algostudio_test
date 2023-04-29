import 'package:algostudio_test/core/config/constants.dart';
import 'package:algostudio_test/presentation/providers/detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyComplexImage extends StatefulWidget {
  const MyComplexImage({Key? key, required this.imgUrl}) : super(key: key);

  final String imgUrl;

  @override
  State<MyComplexImage> createState() => _MyComplexImageState();
}

class _MyComplexImageState extends State<MyComplexImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Stack(
        children: [
          Image.network(
            widget.imgUrl,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return const Icon(Icons.error);
            },
          ),
          for (int i = 0;
              i < Provider.of<DetailNotifier>(context).addedText.length;
              i++)
            Positioned(
              left: Provider.of<DetailNotifier>(context).offsets[i].dx,
              top: Provider.of<DetailNotifier>(context).offsets[i].dy,
              child: GestureDetector(
                onPanUpdate: (details) {
                  Provider.of<DetailNotifier>(context, listen: false)
                      .updateOffset(
                    i,
                    details,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    Provider.of<DetailNotifier>(context).addedText[i],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
