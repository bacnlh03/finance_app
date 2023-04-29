import 'package:equatable/equatable.dart';
import 'package:finance_app/src/core/usecase.dart';
import 'package:finance_app/src/domain/entities/user_entity.dart';
import 'package:finance_app/src/domain/repositories/firebase_repository.dart';

class SignUpUserUseCase implements FutureUseCase<void, Params> {
  final FirebaseRepository repository;

  const SignUpUserUseCase({required this.repository});

  @override
  Future<void> call(Params params) {
    return repository.signUpUser(params.user);
  }
}

class Params extends Equatable {
  final UserEntity user;

  const Params({required this.user});

  @override
  List<Object?> get props => [user];
}
