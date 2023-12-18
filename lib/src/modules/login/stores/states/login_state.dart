
import 'package:chat_firebase/src/modules/login/models/user_auth_model.dart';

sealed class LoginState {

  const LoginState();
  
  factory LoginState.initState() {
    return InitialLoginState();
  }
}

class LoadingLoginState extends LoginState {}
class InitialLoginState extends LoginState {}
class AuthenticatedLoginState extends LoginState {
  final UserAuthModel user;

  AuthenticatedLoginState({required this.user});
}