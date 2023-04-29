import 'package:finance_app/src/domain/entities/user_entity.dart';
import 'package:finance_app/src/domain/repositories/firebase_repository.dart';

class SignUpUserUseCase {
  final FirebaseRepository repository;

  const SignUpUserUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.signUpUser(user);
  }
}
