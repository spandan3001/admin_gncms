import 'package:admin_gncms/user_login_in/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../admin_home_screen.dart';

class ScreenDecider extends StatefulWidget {
  const ScreenDecider({Key? key}) : super(key: key);
  static const id = '/screen_decider';

  @override
  State<ScreenDecider> createState() => _ScreenDeciderState();
}

class _ScreenDeciderState extends State<ScreenDecider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return const AdminHomeScreen();
            } else {
              return const LoginScreen();
            }
          },
          stream: FirebaseAuth.instance.authStateChanges()),
    );
  }
}
