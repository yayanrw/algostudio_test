import 'package:algostudio_test/core/config/constants.dart';
import 'package:flutter/material.dart';

class MyComplexImage extends StatefulWidget {
  const MyComplexImage(
      {Key? key, required this.imgUrl, required this.addedText})
      : super(key: key);

  final String imgUrl;
  final List<String> addedText;

  @override
  State<MyComplexImage> createState() => _MyComplexImageState();
}

class _MyComplexImageState extends State<MyComplexImage> {
  List<Offset> _offsets = [];

  @override
  void initState() {
    super.initState();
    _offsets = List.filled(widget.addedText.length, Offset.zero);
    print("anjing ${widget.addedText}");
  }

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
          for (int i = 0; i < widget.addedText.length; i++)
            Positioned(
              left: _offsets[i].dx,
              top: _offsets[i].dy,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _offsets[i] = Offset(
                      _offsets[i].dx + details.delta.dx,
                      _offsets[i].dy + details.delta.dy,
                    );
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    widget.addedText[i],
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
