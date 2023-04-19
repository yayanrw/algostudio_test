import 'package:algostudio_test/core/config/constants.dart';
import 'package:algostudio_test/core/utils/request_state.dart';
import 'package:algostudio_test/presentation/providers/memes_notifier.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<MemesNotifier>(context, listen: false).fetchMemes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: Consumer<MemesNotifier>(
        builder: (context, data, _) {
          if (data.requestState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.requestState == RequestState.error) {
            return Center(
              child: Text(data.message),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: data.memes.length,
              itemBuilder: (context, index) {
                final meme = data.memes[index];
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: Image.network(meme.url),
                );
              },
            );
          }
        },
      ),
    );
  }
}
