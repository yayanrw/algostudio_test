import 'package:algostudio_test/core/config/constants.dart';
import 'package:algostudio_test/core/router/router.dart';
import 'package:algostudio_test/presentation/providers/memes_notifier.dart';
import 'package:flutter/material.dart';
import 'package:algostudio_test/core/di/injection.dart' as di;
import 'package:provider/provider.dart';

Future<void> main() async {
  di.configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.getIt<MemesNotifier>()),
      ],
      child: MaterialApp.router(
        useInheritedMediaQuery: true,
        title: appTitle,
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
