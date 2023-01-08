import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quranazapp/features/ayah/data/datasources/ayah_local_data_source.dart';
import 'package:quranazapp/features/surah/data/datasources/surah_local_data_source.dart';
import 'package:quranazapp/features/surah/data/repositories/surah_repository_impl.dart';
import 'package:quranazapp/features/surah/domain/repositories/surah_repository.dart';
import 'package:quranazapp/features/surah/domain/usecases/surah_usecase.dart';
import 'package:quranazapp/features/surah/presentation/bloc/surah_cubit.dart';

import 'features/ayah/data/datasources/ayah_remote_data_source.dart';
import 'features/ayah/data/repositories/ayah_repository_impl.dart';
import 'features/ayah/domain/repositories/ayah_repository.dart';
import 'features/ayah/domain/usecases/ayah_usecase.dart';
import 'features/ayah/presentation/bloc/ayah_cubit.dart';

final getIt = GetIt.instance;

Future<void> initalize() async {
  initCubits();
  initUseCases();
  initRepos();

  initDataSources();

  await initExternals();
}

void initCubits() {
  getIt.registerFactory(() => SurahCubit(getIt()));
  getIt.registerFactory(() => AyahCubit(getIt(), getIt()));
}

void initRepos() {
  getIt.registerLazySingleton<SurahRepository>(() => SurahRepositoryImpl(getIt()));
  getIt.registerLazySingleton<AyahRepository>(() => AyahRepositoryImpl(getIt(), getIt()));
}

void initUseCases() {
  getIt.registerLazySingleton(() => GetSurahsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAyatUseCase(getIt()));
  getIt.registerLazySingleton(() => GetOneAyahUseCase(getIt()));
}

void initDataSources() {
  getIt.registerLazySingleton<SurahLocalDataSource>(() => SurahLocalDataSourceImpl());
  getIt.registerLazySingleton<AyahRemoteDataSource>(() => AyahRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<AyahLocalDataSource>(() => AyahLocalDataSourceImpl());
}

final navigatorKey = GlobalKey<NavigatorState>();
final ctx = navigatorKey.currentContext;
Future<void> initExternals() async {
  getIt.registerLazySingleton(() => navigatorKey);
  getIt.registerLazySingleton(() => Dio());
}
