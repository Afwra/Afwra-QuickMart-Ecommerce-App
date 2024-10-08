import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/features/auth/data/models/auth_model.dart';
import 'package:quick_mart/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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

  @override
  Future<Either<Failures, AuthModel>> loginViaGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Left(ServerFailure('User Canceled')); // User canceled sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      log('Google Success ${userCredential.user}');
      return Right(AuthModel(token: ''));
    } catch (e) {
      log("Google Sign-In Error: $e");
      return Left(ServerFailure(e.toString()));
    }
  }
}
