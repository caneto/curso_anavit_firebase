import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/failures/app_failure.dart';
import '../models/user_model.dart';
import '../repository/interfaces/i_user_repository.dart';
import 'events/user_event.dart';
import 'states/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._repository) : super(UserState.initState()) {
    on<LoadUserEvent>((_, emit) => _load(emit));
    on<LogoutUserEvent>((_, emit) => _logout(emit));
  }

  final IUserRepository _repository;

  UserModel get user => (state as LoggedUserState).user;

  Future<void> _load(Emitter<UserState> emit) async {
    try {
      final user = await _repository.getUser();

      emit(LoggedUserState(user));
    } on AppFailure {
      emit(const LoggedOutUserState());
    }
  }

  Future<void> _logout(Emitter<UserState> emit) async {
    await _repository.logout();

    emit(const LoggedOutUserState());
  }
}
