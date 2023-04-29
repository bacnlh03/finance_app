import 'package:finance_app/src/core/usecase.dart';
import 'package:finance_app/src/domain/repositories/firebase_repository.dart';

class SignOutUseCase implements FutureUseCase<void, NoParams> {
  final FirebaseRepository repository;

  const SignOutUseCase({required this.repository});

  @override
  Future<void> call(NoParams params) {
    return repository.signOut();
  }
}
