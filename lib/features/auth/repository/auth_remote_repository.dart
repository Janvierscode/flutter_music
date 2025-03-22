import 'dart:convert';
import 'dart:io';

import 'package:flutter_music/core/constants/server_constant.dart';
import 'package:flutter_music/core/failure/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(
      '${ServerConstant.baseURL}signUp?key=${ServerConstant.apiKey}',
    );
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final user = UserModel.fromMap(responseBody, name);
        print(user);

        return Right(user);
      } else {
        return Left(AppFailure(responseBody["error"]["message"]));
      }
    } on SocketException {
      return Left(
        AppFailure('Please check your internet connection and try again.'),
      );
    } catch (e) {
      return Left(AppFailure('Unexpected error: $e'));
    }
  }

  Future<Either<AppFailure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(
      '${ServerConstant.baseURL}signInWithPassword?key=${ServerConstant.apiKey}',
    );
    //
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        final user = UserModel.fromMap(responseBody, "");
        return Right(user);
      } else {
        return Left(AppFailure(responseBody['error']['message']));
      }
    } on SocketException {
      return Left(
        AppFailure('Please check your internet connection and try again.'),
      );
    } catch (e) {
      return Left(AppFailure('Unexpected error: $e'));
    }
  }
}
