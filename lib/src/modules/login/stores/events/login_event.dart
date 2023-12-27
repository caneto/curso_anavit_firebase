class LoginEvent {
  const LoginEvent();
}

class SubmitFormLoginEvent extends LoginEvent {

  const SubmitFormLoginEvent({
    required this.email,
    required this.password,
  });
  
  final String email;
  final String password;
}
