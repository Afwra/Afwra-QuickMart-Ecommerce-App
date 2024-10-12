import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/features/auth/data/models/auth_model.dart';
import 'package:quick_mart/features/auth/data/models/user_model.dart';
import 'package:quick_mart/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failures, UserModel>> login(
      {required String email,
      required String password,
      String lang = 'en'}) async {
    try {
      var data = await apiService.post(
        endpoint: AppConstants.loginEndpoint,
        data: {'email': email, 'password': password},
        headers: {'lang': lang},
      );
      if (data['status'] == true) {
        return right(UserModel.fromJson(data['data']));
      } else {
        return left(ServerFailure(data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.dioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, UserModel>> register(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber,
      String lang = 'en'}) async {
    try {
      var data = await apiService.post(
        endpoint: AppConstants.registerEndpoint,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phoneNumber
        },
        headers: {'lang': lang},
      );
      if (data['status'] == true) {
        return right(UserModel.fromJson(data['data']));
      } else {
        return left(ServerFailure(data['message']));
      }
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
      return Left(ServerFailure('Cannot Connect To Google Server'));
    }
  }
}
