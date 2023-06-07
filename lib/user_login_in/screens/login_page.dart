import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../helper.dart';
import '../common/theme_helper.dart';
import '../screen_decider.dart';
import 'forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const id = '/loginScreen';

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final Key _formKey = GlobalKey<FormState>();
  final TextEditingController _emailEnteredController = TextEditingController(),
      _passwordController = TextEditingController();

  bool isErrorLog = false;

  String errorMessage = "";
  bool showPassword = false;
  bool isShowIconPresent = false;

  bool isActive = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: const EdgeInsets.fromLTRB(
                  20, 10, 20, 10), // This will be the login form
              child: Column(
                children: [
                  const SizedBox(height: 30.0),
                  const Icon(Icons.lock, size: 100),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Hello',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Sign in into your account',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30.0),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextField(
                            controller: _emailEnteredController,
                            decoration: ThemeHelper().textInputDecoration(
                                lableText: 'User Name',
                                hintText: 'Enter your user name',
                                suffixIcon: null),
                          ),
                          const SizedBox(height: 30.0),
                          TextField(
                            obscureText: !showPassword,
                            decoration: ThemeHelper().textInputDecoration(
                                lableText: 'Password',
                                hintText: 'Enter your password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    showPassword = !showPassword;
                                    setState(() {});
                                  },
                                )),
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ForgotPasswordScreen.id);
                              },
                              child: const Text(
                                "Forgot your password?",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          if (isErrorLog)
                            Text(errorMessage,
                                style: const TextStyle(
                                  color: Colors.red,
                                )),
                          const SizedBox(height: 15.0),
                          ElevatedButton(
                            style: ThemeHelper().buttonStyle(
                              isActive ? Colors.black : Colors.grey,
                            ),
                            child: Text(
                              'Log in'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              signIn();
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            //child: Text('Don\'t have an account? Create'),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: "Don't have an account? "),
                                  TextSpan(
                                    text: 'Create',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigator.pushNamed(
                                        //     context, RegistrationScreen.id);
                                      },
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              )),
        ),
      ),
    );
  }

  void signIn() async {
    //await getUser();
    try {
      loadingDialog();
      await loginCheck();
    } on FirebaseAuthException catch (e) {
      onError(e);
    }
  }

  Future<void> loginCheck() async {
    var snap =
        await FirebaseFirestore.instance.collection('users').doc('admin').get();
    Map<String, dynamic> data = snap.data()!;
    List<dynamic> account = data['account'];

    print(account);

    //search for user account
    var result = Helpers.findById(account, _emailEnteredController.text);

    if (result != null) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailEnteredController.text,
          password: _passwordController.text);
      navigateAuthScreen();
    } else {
      popContext();

      setState(() {
        isErrorLog = true;
        errorMessage = "User Not Found";
      });
    }
  }

  void loadingDialog() {
    showDialog(
        useRootNavigator: false,
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
  }

  void onError(FirebaseAuthException e) {
    Navigator.pop(context);
    if (e.code == "unknown") {
      errorMessage = "Nothing is Entered";
    } else if (e.code == "wrong-password") {
      errorMessage = "Wrong password.Try Again";
    } else if (e.code == "user-not-found") {
      errorMessage = "User Not Found";
    } else if (e.code == "too-many-requests") {
      isActive = false;
      startTimerForActivateButton();
    }
    setState(() {
      isErrorLog = true;
      errorMessage = e.code;
    });
  }

  void startTimerForActivateButton() {
    Timer(const Duration(seconds: 5), () {
      isActive = true;
      setState(() {
        errorMessage = "";
      });
    });
  }

  void popContext() {
    Navigator.pop(context);
  }

  void navigateAuthScreen() {
    popContext();
    setState(() {});
    Navigator.pushNamedAndRemoveUntil(
        context, ScreenDecider.id, (route) => false);
  }
}
