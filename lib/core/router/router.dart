import 'package:algostudio_test/domain/entities/meme.dart';
import 'package:algostudio_test/presentation/pages/detail_page.dart';
import 'package:algostudio_test/presentation/pages/home_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
        ),
        AutoRoute(path: '/detail/:meme', page: DetailRoute.page)
      ];
}
