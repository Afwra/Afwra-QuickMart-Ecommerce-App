import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupAuthServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(apiService: getIt.get<ApiService>()));
}
