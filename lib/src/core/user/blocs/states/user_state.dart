
import '../../models/user_model.dart';

sealed class UserState {
  const UserState();

  factory UserState.initState() {
    return const LoggedOutUserState();
  }
}

class LoggedUserState  extends UserState {
  LoggedUserState(this.user);

  final UserModel user;
  
}

class LoggedOutUserState extends UserState {
  const LoggedOutUserState();
}

