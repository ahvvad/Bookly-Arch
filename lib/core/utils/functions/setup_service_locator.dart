import 'package:arch_bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:arch_bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:arch_bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:arch_bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSources: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
