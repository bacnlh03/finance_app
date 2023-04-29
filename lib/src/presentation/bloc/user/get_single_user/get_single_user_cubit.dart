import 'package:equatable/equatable.dart';
import 'package:finance_app/src/domain/entities/user_entity.dart';
import 'package:finance_app/src/domain/usecases/get_single_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;

  GetSingleUserCubit({required this.getSingleUserUseCase})
      : super(GetSingleUserInitial());

  Future<void> getSingleUser({required String uid}) async {
    emit(GetSingleUserLoading());

    try {
      final streamResponse = getSingleUserUseCase.call(uid);

      streamResponse.listen((users) {
        if (users.isNotEmpty) {
          emit(GetSingleUserLoaded(user: users.first));
        }
      });
    } catch (_) {
      emit(GetSingleUserFailure());
    }
  }
}
