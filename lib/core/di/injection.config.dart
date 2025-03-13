// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:realview_challenge/core/di/dio_module.dart' as _i349;
import 'package:realview_challenge/core/theme/app_theme.dart' as _i945;
import 'package:realview_challenge/data/remote/authors_remote_data_source_impl.dart'
    as _i50;
import 'package:realview_challenge/data/repositories/authors_repository_impl.dart'
    as _i699;
import 'package:realview_challenge/domain/remote/authors_remote_data_source.dart'
    as _i255;
import 'package:realview_challenge/domain/repositories/authors_repository.dart'
    as _i1038;
import 'package:realview_challenge/domain/usecases/get_authors.dart' as _i21;
import 'package:realview_challenge/presentation/cubits/authors_cubit.dart'
    as _i834;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i945.AppTheme>(() => _i945.AppTheme());
    gh.factory<_i255.AuthorsRemoteDataSource>(
      () => _i50.AuthorsRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1038.AuthorsRepository>(
      () => _i699.AuthorsRepositoryImpl(
        remoteDataSource: gh<_i255.AuthorsRemoteDataSource>(),
      ),
    );
    gh.factory<_i21.GetAuthors>(
      () => _i21.GetAuthors(gh<_i1038.AuthorsRepository>()),
    );
    gh.factory<_i834.AuthorsCubit>(
      () => _i834.AuthorsCubit(getAuthorsUseCase: gh<_i21.GetAuthors>()),
    );
    return this;
  }
}

class _$DioModule extends _i349.DioModule {}
