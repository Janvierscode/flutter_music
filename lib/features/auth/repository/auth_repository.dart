import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_music/features/auth/model/user_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/failure/failure.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Register user and save to Firestore
  Future<Either<AppFailure, UserModel>> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = UserModel.fromUserCredential(userCredential, name);
      // final saveResult = await _authFirestoreService.saverUser(user);

      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Left(AppFailure('Account on this email already exists'));
      } else if (e.code == 'network-request-failed') {
        return Left(AppFailure('A network error has occurred'));
      } else {
        return Left(AppFailure('Authentication error: $e'));
      }
    } catch (e) {
      return Left(AppFailure('Unexpected error: $e'));
    }
  }

  // login User
  Future<Either<AppFailure, String>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return Right("");
      // UserModel authUser = UserModel.fromUserCredential(
      //   userCredential,
      //   "Unknown",
      // );
      // final result = await _authFirestoreService.getUser(authUser.id);
      // return result.match(
      //   (failure) {
      //     // _authFirestoreService.saverUser(authUser);
      //     return right(authUser);
      //   },
      // (firestoreUser) {
      //   return right(
      //     UserModel(
      //       name:
      //           firestoreUser.name.isNotEmpty
      //               ? firestoreUser.name
      //               : authUser.name,
      //       email: firestoreUser.email,
      //       id: firestoreUser.id,
      //       createdAt: firestoreUser.createdAt,
      //     ),
      //   );
      // };
      // );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        return Left(AppFailure('A network error has occurred'));
      } else if (e.code == 'invalid-credential') {
        return Left(AppFailure('Please enter the correct credential'));
      } else {
        return Left(AppFailure(e.message ?? 'Sign-in error'));
      }
    } catch (e) {
      return Left(AppFailure('Unexpected error: $e'));
    }
  }
}
