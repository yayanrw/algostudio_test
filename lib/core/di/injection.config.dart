// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasources/remote/remote_datasource.dart' as _i5;
import '../../data/repositories/meme_repository_impl.dart' as _i7;
import '../../domain/repositories/meme_repository.dart' as _i6;
import '../../domain/usecases/get_memes.dart' as _i8;
import '../router/router.dart' as _i3;
import 'register_module.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppRouter>(registerModule.appRouter);
    gh.lazySingleton<_i4.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i5.RemoteDataSource>(
        () => _i5.RemoteDataSourceImpl(gh<_i4.Client>()));
    gh.lazySingleton<_i6.MemeRepository>(
        () => _i7.MemeRepositoryImpl(gh<_i5.RemoteDataSource>()));
    gh.lazySingleton<_i8.GetMemes>(
        () => _i8.GetMemes(gh<_i6.MemeRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
