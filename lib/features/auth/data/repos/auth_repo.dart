import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/features/auth/data/models/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, AuthModel>> login({
    required String email,
    required String password,
  });
  Future<Either<Failures, AuthModel>> register({
    required String email,
    required String password,
  });
}
