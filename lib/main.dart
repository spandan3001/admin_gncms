import 'package:admin_gncms/admin_home_screen.dart';
import 'package:admin_gncms/user_login_in/screen_decider.dart';
import 'package:admin_gncms/user_login_in/screens/forgot_password_page.dart';
import 'package:admin_gncms/user_login_in/screens/login_page.dart';
import 'package:admin_gncms/user_login_in/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'add_student/add_student.dart';
import 'add_student/page_view_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GNCMSAdmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        ScreenDecider.id: (context) => const ScreenDecider(),
        AddStudent.id: (context) => const AddStudent(),
        AddStudentScreen.id: (context) => const AddStudentScreen(),
      },
    );
  }
}
