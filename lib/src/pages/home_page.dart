import 'package:chat_firebase/src/widgets/contacts_widget.dart';
import 'package:chat_firebase/src/widgets/home_app_bar_widget.dart';
import 'package:chat_firebase/src/widgets/status_card_widgets.dart';
import 'package:chat_firebase/src/widgets/user_image_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child:  ContactsWidget()
        ),
      ),
    );
  }
}
