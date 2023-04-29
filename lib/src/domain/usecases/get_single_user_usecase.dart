import 'package:equatable/equatable.dart';
import 'package:finance_app/src/core/usecase.dart';
import 'package:finance_app/src/domain/entities/user_entity.dart';
import 'package:finance_app/src/domain/repositories/firebase_repository.dart';

class GetSingleUserUseCase implements StreamUseCase<List<UserEntity>, Params> {
  final FirebaseRepository repository;

  const GetSingleUserUseCase({required this.repository});

  @override
  Stream<List<UserEntity>> call(Params params) {
    return repository.getSingleUser(params.uid);
  }
}

class Params extends Equatable {
  final String uid;

  const Params({required this.uid});

  @override
  List<Object?> get props => [uid];
}
