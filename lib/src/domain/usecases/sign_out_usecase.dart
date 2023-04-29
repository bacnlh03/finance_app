import 'package:finance_app/src/domain/repositories/firebase_repository.dart';

class SignOutUseCase {
  final FirebaseRepository repository;

  const SignOutUseCase({required this.repository});

  Future<void> call() {
    return repository.signOut();
  }
}
