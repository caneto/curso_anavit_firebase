class LoginEvent {
  const LoginEvent();
}

class SubmitFormLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const SubmitFormLoginEvent({
    required this.email,
    required this.password,
  });
}
