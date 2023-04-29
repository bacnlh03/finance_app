import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/src/data/datasources/remote_data_sources/firebase_remote_data_source.dart';
import 'package:finance_app/src/data/datasources/remote_data_sources/firebase_remote_data_source_impl.dart';
import 'package:finance_app/src/data/repositories/firebase_repository_impl.dart';
import 'package:finance_app/src/domain/repositories/firebase_repository.dart';
import 'package:finance_app/src/domain/usecases/create_user_usecase.dart';
import 'package:finance_app/src/domain/usecases/get_current_uid.dart';
import 'package:finance_app/src/domain/usecases/get_single_user_usecase.dart';
import 'package:finance_app/src/domain/usecases/is_sign_in_usecase.dart';
import 'package:finance_app/src/domain/usecases/sign_in_user_usecase.dart';
import 'package:finance_app/src/domain/usecases/sign_out_usecase.dart';
import 'package:finance_app/src/domain/usecases/sign_up_user_usecase.dart';
import 'package:finance_app/src/presentation/bloc/auth/auth_state.dart';
import 'package:finance_app/src/presentation/bloc/credential/credential_state.dart';
import 'package:finance_app/src/presentation/bloc/user/get_single_user/get_single_user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => AuthCubit(
      signOutUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      getCurrentUidUseCase: sl.call(),
    ),
  );

  sl.registerFactory(
    () => CredentialCubit(
      signUpUseCase: sl.call(),
      signInUseCase: sl.call(),
    ),
  );

  sl.registerFactory(
    () => GetSingleUserCubit(getSingleUserUseCase: sl.call()),
  );

  sl.registerLazySingleton(
    () => CreateUserUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => GetCurrentUidUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => GetSingleUserUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => IsSignInUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => SignInUserUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => SignOutUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => SignUpUserUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<FirebaseRepository>(
    () => FirebaseRepositoryImpl(remoteDataSource: sl.call()),
  );

  sl.registerLazySingleton<FirebaseRemoteDataSource>(
    () => FirebaseRemoteDataSourceImpl(
      firebaseFirestore: sl.call(),
      firebaseAuth: sl.call(),
      firebaseStorage: sl.call(),
    ),
  );

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;

  sl.registerLazySingleton(
    () => firebaseAuth,
  );
  sl.registerLazySingleton(
    () => firebaseFirestore,
  );
  sl.registerLazySingleton(
    () => firebaseStorage,
  );
}
