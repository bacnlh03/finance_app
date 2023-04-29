import 'package:finance_app/src/domain/repositories/firebase_repository.dart';

class IsSignInUseCase {
  final FirebaseRepository repository;

  const IsSignInUseCase({required this.repository});

  Future<bool> call() {
    return repository.isSignIn();
  }
}
