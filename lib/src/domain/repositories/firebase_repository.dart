import 'package:finance_app/src/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  // Credential features
  Future<void> signInUser(UserEntity user);
  Future<void> signUpUser(UserEntity user);
  Future<void> signOut();
  Future<bool> isSignIn();

  // User features
  Future<void> createUser(UserEntity user);
  Stream<List<UserEntity>> getSingleUser(String uid);
  Future<String> getCurrentUid();
}