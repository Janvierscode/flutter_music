// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserModel({
    required this.idToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.localId,
    required this.name,
    required this.email,
    required this.createdAt,
  });
  final String idToken;
  final String refreshToken;
  final String expiresIn;
  final String localId;
  final String name;
  final String email;
  final DateTime createdAt;

  UserModel copyWith({
    String? idToken,
    String? refreshToken,
    String? expiresIn,
    String? localId,
    String? name,
    String? email,
    DateTime? createdAt,
  }) {
    return UserModel(
      idToken: idToken ?? this.idToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresIn: expiresIn ?? this.expiresIn,
      localId: localId ?? this.localId,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idToken': idToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
      'localId': localId,
      'name': name,
      'email': email,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String name) {
    return UserModel(
      localId: map['localId'] as String,

      idToken: map['idToken'] as String,
      refreshToken: map['refreshToken'] as String,
      expiresIn: map['expiresIn'] as String,
      name: name,
      email: map['email'] as String,
      createdAt: DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source, String name) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>, name);

  factory UserModel.fromUserCredential(
    UserCredential userCredential,
    String name,
  ) {
    return UserModel(
      name: name,
      email: userCredential.user!.email ?? '',
      createdAt: DateTime.now(),
      expiresIn: userCredential.user!.tenantId ?? '',

      idToken: userCredential.user!.uid,
      localId: userCredential.user!.uid,
      refreshToken: userCredential.user!.refreshToken ?? '',
    );
  }

  @override
  String toString() {
    return 'UserModel(idToken: $idToken, refreshToken: $refreshToken, expiresIn: $expiresIn, localId: $localId, name: $name, email: $email, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.idToken == idToken &&
        other.refreshToken == refreshToken &&
        other.expiresIn == expiresIn &&
        other.localId == localId &&
        other.name == name &&
        other.email == email &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return idToken.hashCode ^
        refreshToken.hashCode ^
        expiresIn.hashCode ^
        localId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        createdAt.hashCode;
  }
}
