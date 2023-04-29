import 'package:finance_app/src/core/usecase.dart';
import 'package:finance_app/src/domain/repositories/firebase_repository.dart';

class IsSignInUseCase implements FutureUseCase<bool, NoParams> {
  final FirebaseRepository repository;

  const IsSignInUseCase({required this.repository});

  @override
  Future<bool> call(NoParams params) {
    return repository.isSignIn();
  }
}
