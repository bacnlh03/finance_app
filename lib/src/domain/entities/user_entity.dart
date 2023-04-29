import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? email;
  final String? lastName;
  final String? firstName;
  final String? password;

  const UserEntity({
    this.uid,
    this.email,
    this.lastName,
    this.firstName,
    this.password,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        lastName,
        firstName,
        password,
      ];
}
