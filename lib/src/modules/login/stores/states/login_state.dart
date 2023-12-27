import '../../../../core/shared/failures/app_failure.dart';
import '../../models/user_auth_model.dart';

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
  const FailureLoginState(this.failure);
  final AppFailure failure;
}


class AuthenticatedLoginState extends LoginState {

  AuthenticatedLoginState(this.user);
  final UserAuthModel user;
}