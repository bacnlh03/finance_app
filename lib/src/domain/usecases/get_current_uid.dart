import 'package:finance_app/src/core/usecase.dart';
import 'package:finance_app/src/domain/repositories/firebase_repository.dart';

class GetCurrentUidUseCase implements FutureUseCase<String, NoParams> {
  final FirebaseRepository repository;

  const GetCurrentUidUseCase({required this.repository});

  @override
  Future<String> call(NoParams params) {
    return repository.getCurrentUid();
  }
}
