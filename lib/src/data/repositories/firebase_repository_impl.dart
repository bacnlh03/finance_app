import 'package:finance_app/src/data/datasources/remote_data_sources/firebase_remote_data_source.dart';
import 'package:finance_app/src/domain/entities/user_entity.dart';
import 'package:finance_app/src/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  const FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<bool> isSignIn() {
    return remoteDataSource.isSignIn();
  }

  @override
  Future<void> signInUser(UserEntity user) {
    return remoteDataSource.signInUser(user);
  }

  @override
  Future<void> signOut() {
    return remoteDataSource.signOut();
  }

  @override
  Future<void> signUpUser(UserEntity user) {
    return remoteDataSource.signUpUser(user);
  }
  
  @override
  Future<void> createUser(UserEntity user) async {
    return remoteDataSource.createUser(user);
  }
  
  @override
  Future<String> getCurrentUid() async {
    return remoteDataSource.getCurrentUid();
  }
  
  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    return remoteDataSource.getSingleUser(uid);
  }
}
