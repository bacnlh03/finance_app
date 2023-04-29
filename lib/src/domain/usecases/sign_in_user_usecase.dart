import 'package:finance_app/src/domain/entities/user_entity.dart';
import 'package:finance_app/src/domain/repositories/firebase_repository.dart';

class SignInUserUseCase {
  final FirebaseRepository repository;

  const SignInUserUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.signInUser(user);
  }
}
