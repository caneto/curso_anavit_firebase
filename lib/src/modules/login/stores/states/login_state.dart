
import 'package:chat_firebase/src/core/shared/failures/app_failure.dart';
import 'package:chat_firebase/src/modules/login/models/user_auth_model.dart';

sealed class LoginState {

  const LoginState();
  
  factory LoginState.initState() {
    return const InitialLoginState();
  }
}

class InitialLoginState extends LoginState {
  const InitialLoginState();
}

class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

class FailureLoginState extends LoginState {
  final AppFailure failure;
  const FailureLoginState(this.failure);
}


class AuthenticatedLoginState extends LoginState {
  final UserAuthModel user;

  AuthenticatedLoginState(this.user);
}