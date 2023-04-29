import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    String? uid,
    String? email,
    String? lastName,
    String? firstName,
    String? password,
  }) : super(
          uid: uid,
          email: email,
          lastName: lastName,
          firstName: firstName,
          password: password,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      uid: snapshot['uid'],
      email: snapshot['email'],
      lastName: snapshot['lastName'],
      firstName: snapshot['firstName'],
      password: snapshot['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'lastName': lastName,
        'firstName': firstName,
        'password': password,
      };

  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      lastName: lastName,
      firstName: firstName,
      password: password,
    );
  }
}
