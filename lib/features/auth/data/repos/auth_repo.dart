import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/features/auth/data/models/auth_model.dart';
import 'package:quick_mart/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserModel>> login({
    required String email,
    required String password,
    String lang,
  });
  Future<Either<Failures, AuthModel>> loginViaGoogle();
  Future<Either<Failures, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    String lang,
  });
}
