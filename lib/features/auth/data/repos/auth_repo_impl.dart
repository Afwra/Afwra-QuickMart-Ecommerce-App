import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/features/auth/data/models/auth_model.dart';
import 'package:quick_mart/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failures, AuthModel>> login(
      {required String email, required String password}) async {
    try {
      var data = await apiService.post(
          endpoint: AppConstants.loginEndpoint,
          data: {'username': email, 'password': password});
      return right(AuthModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.dioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, AuthModel>> register(
      {required String email, required String password}) async {
    try {
      var data = await apiService.get(
        endpoint: AppConstants.loginEndpoint,
      );
      return right(AuthModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.dioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
