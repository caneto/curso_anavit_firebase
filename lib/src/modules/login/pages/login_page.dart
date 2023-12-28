import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/events/login_event.dart';
import '../blocs/login_bloc.dart';
import '../blocs/states/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

   void listenLogin(BuildContext context, LoginState state) {
    if (state is AuthenticatedLoginState) {
      Navigator.of(context).pushReplacementNamed('/');
    } else if(state is FailureLoginState) {
      final messenger = ScaffoldMessenger.of(context);
      final snackBar = SnackBar(content: Text(state.failure.message));

      messenger.showSnackBar(snackBar);
    }
  }

  void submit() {
    final event = SubmitFormLoginEvent(
      email: emailEC.text,
      password: passwordEC.text,
    );

    widget.loginBloc.add(event);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        color: theme.primaryColor,
        child: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Login",
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 28),
                  TextField(
                    controller: emailEC,
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: theme.iconTheme.color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: passwordEC,
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.password_outlined,
                        color: theme.iconTheme.color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  BlocConsumer(
                    bloc: widget.loginBloc,
                    listener: listenLogin,
                    builder: (context, state) {
                      if(state is LoadingLoginState) {
                        return const CircularProgressIndicator.adaptive();
                      }
                      return ElevatedButton(
                        onPressed: submit,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('Login'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
