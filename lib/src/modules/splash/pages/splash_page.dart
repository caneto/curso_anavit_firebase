import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/user/blocs/events/user_event.dart';
import '../../../core/user/blocs/states/user_state.dart';
import '../../../core/user/blocs/user_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.userBloc,
  });

  final UserBloc userBloc;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  late final StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    
    _subscription = widget.userBloc.stream.listen((state) {
      final String route = switch (state) {
        LoggedOutUserState() => '/login/',
        LoggedUserState() => '/home',
      };
      
      Modular.to.pushReplacementNamed(route);

    });
    widget.userBloc.add(const LoadUserEvent());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
