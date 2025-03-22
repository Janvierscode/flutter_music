import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/failure/failure.dart';
import '../model/user_model.dart';

class AuthFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // save UserModel to firestore
  Future<Either<AppFailure, void>> saverUser(UserModel user) async {
    try {
      await _firestore
          .collection('users')
          .add(user.toMap())
          .then(
            (DocumentReference doc) =>
                print('debugPrint: DocumentSnapshot added with ID: ${doc.id}'),
          );
      return right(null);
    } catch (e) {
      return Left(AppFailure('Error saving User: $e'));
    }
  }

  // fetch UserModel from firestore
  // Future<Either<AppFailure, UserModel>> getUser(String id) async {
  //   try {
  //     DocumentSnapshot doc = await _firestore.collection('users').doc(id).get();
  //     if (doc.exists) {
  // return right(UserModel.fromMap(doc.data() as Map<String, dynamic>, ));
  // } else {
  //       return Left(AppFailure("User not found"));
  //     }
  //   } catch (e) {
  //     return Left(AppFailure("Error Fetching User: $e"));
  //   }
  // }
}
