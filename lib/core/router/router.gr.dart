// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailPage(
          key: args.key,
          meme: args.meme,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    GeneratedImageRoute.name: (routeData) {
      final args = routeData.argsAs<GeneratedImageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GeneratedImagePage(
          key: args.key,
          myBytes: args.myBytes,
        ),
      );
    },
  };
}

/// generated route for
/// [DetailPage]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    Key? key,
    required Meme meme,
    List<PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            meme: meme,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const PageInfo<DetailRouteArgs> page = PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.meme,
  });

  final Key? key;

  final Meme meme;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, meme: $meme}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GeneratedImagePage]
class GeneratedImageRoute extends PageRouteInfo<GeneratedImageRouteArgs> {
  GeneratedImageRoute({
    Key? key,
    required Uint8List myBytes,
    List<PageRouteInfo>? children,
  }) : super(
          GeneratedImageRoute.name,
          args: GeneratedImageRouteArgs(
            key: key,
            myBytes: myBytes,
          ),
          initialChildren: children,
        );

  static const String name = 'GeneratedImageRoute';

  static const PageInfo<GeneratedImageRouteArgs> page =
      PageInfo<GeneratedImageRouteArgs>(name);
}

class GeneratedImageRouteArgs {
  const GeneratedImageRouteArgs({
    this.key,
    required this.myBytes,
  });

  final Key? key;

  final Uint8List myBytes;

  @override
  String toString() {
    return 'GeneratedImageRouteArgs{key: $key, myBytes: $myBytes}';
  }
}
