import 'package:algostudio_test/core/config/constants.dart';
import 'package:algostudio_test/domain/entities/meme.dart';
import 'package:algostudio_test/presentation/providers/detail_notifier.dart';
import 'package:algostudio_test/presentation/widgets/my_complex_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.meme}) : super(key: key);

  final Meme meme;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.meme.name), actions: [
        IconButton(
          icon: const Icon(Icons.save),
          onPressed: () {
            // Handle save button press
          },
        ),

      ]),
      body: SingleChildScrollView(
        child: Consumer<DetailNotifier>(
          builder: (context, data, _) {
            return Column(
              children: [
                MyComplexImage(imgUrl: widget.meme.url),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(defaultPadding * 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Add Photo'),
                      onTap: () {
                        Provider.of<DetailNotifier>(context, listen: false)
                            .pickImage();
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.text_fields),
                      title: const Text('Add Text'),
                      onTap: () {
                        Navigator.pop(context);
                        _showAddTextDialog(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTextDialog(BuildContext context) {
    String newText = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Text'),
          content: TextFormField(
            onChanged: (value) {
              newText = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ADD'),
              onPressed: () {
                Provider.of<DetailNotifier>(context, listen: false)
                    .addText(newText);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<DetailNotifier>(context, listen: false).reset();
  }
}
