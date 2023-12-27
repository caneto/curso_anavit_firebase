import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/failures/app_failure.dart';
import '../repository/interfaces/i_login_repository.dart';
import 'events/login_event.dart';
import 'states/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._repository) : super(LoginState.initState()) {
    on<SubmitFormLoginEvent>(_login);
  }

  final ILoginRepository _repository;

  Future<void> _login(
    SubmitFormLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoadingLoginState());

    try {
      final user = await _repository.login(event.email, event.password);

      emit(AuthenticatedLoginState(user));
    } on AppFailure catch (e) {
      emit(FailureLoginState(e));
    }
  }
}
