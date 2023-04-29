import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/src/core/firebase_exception.dart';
import 'package:finance_app/src/core/toast.dart';
import 'package:finance_app/src/data/datasources/remote_data_sources/firebase_remote_data_source.dart';
import 'package:finance_app/src/data/models/user_model.dart';
import 'package:finance_app/src/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  FirebaseRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });
  
  FirebaseExceptionCode? _firebaseExceptionCode;

  @override
  Future<bool> isSignIn() async {
    return firebaseAuth.currentUser?.uid != null;
  }

  @override
  Future<void> signInUser(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty && user.password!.isNotEmpty) {
        showMessage('Processing');
        await firebaseAuth.signInWithEmailAndPassword(
          email: user.email!,
          password: user.password!,
        );
        showMessage('Successful');
      } else {
        showMessage('Fields cannot be empty');
      }
    } on FirebaseAuthException catch (e) {
      _firebaseExceptionCode = FirebaseHandler.handleException(e);
      var message = FirebaseHandler.exceptionMessage(_firebaseExceptionCode!);
      showMessage(message);
    }
  }

  @override
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }

  @override
  Future<void> signUpUser(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty &&
          user.lastName!.isNotEmpty &&
          user.firstName!.isNotEmpty &&
          user.password!.isNotEmpty) {
        showMessage('Processing');
        await firebaseAuth
            .createUserWithEmailAndPassword(
          email: user.email!,
          password: user.password!,
        )
            .then(
          (currentUser) async {
            if (currentUser.user?.uid != null) {
              createUser(user);
            }
          },
        );
        showMessage('Successful');
      } else {
        showMessage('Fields cannot be empty');
      }
      return;
    } on FirebaseAuthException catch (e) {
      _firebaseExceptionCode = FirebaseHandler.handleException(e);
      var message = FirebaseHandler.exceptionMessage(_firebaseExceptionCode!);
      showMessage(message);
    }
  }
  
  @override
  Future<void> createUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection('users');

    final uid = await getCurrentUid();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        uid: uid,
        email: user.email,
        lastName: user.lastName,
        firstName: user.firstName,
        password: user.password,
      ).toJson();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      showMessage(error.toString());
    });
  }
  
  @override
  Future<String> getCurrentUid() async {
    return firebaseAuth.currentUser!.uid;
  }
  
  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    final userCollection = firebaseFirestore
        .collection('users')
        .where('uid', isEqualTo: uid)
        .limit(1);
    return userCollection.snapshots().map(
          (querySnapshot) =>
              querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList(),
        );
  }
}
