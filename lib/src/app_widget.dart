import 'package:chat_firebase/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {

  const AppWidget({ super.key });

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: const HomePage(),
       );
  }
}