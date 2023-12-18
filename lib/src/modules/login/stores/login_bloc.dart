import 'package:chat_firebase/src/modules/login/stores/events/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initState()) {
    on<SubmitFormLoginEvent>(_login);
  }

  Future<void> _login(
    SubmitFormLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoadingLoginState());
    
  }
}
