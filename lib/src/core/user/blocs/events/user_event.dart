
class UserEvent {
  const UserEvent();
}

class LoadUserEvent extends UserEvent {
  const LoadUserEvent();
}

class LogoutUserEvent extends UserEvent {
  LogoutUserEvent();
}