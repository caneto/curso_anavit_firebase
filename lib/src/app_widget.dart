import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/shared/themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {

    Modular.setInitialRoute('/login/');

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: Modular.routerConfig,
    );
  }
}
