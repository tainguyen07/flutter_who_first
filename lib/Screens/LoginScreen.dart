import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../HomePage.dart';
import '../Models/SignUpData.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Who First',
      // logo: AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  Future<String> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    // ignore: missing_return
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs?.setBool("isLoggedIn", true);
      return null;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return '${e.message}';
    }
  }

  Future<String> _signupUser(LoginData data) async {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data.name, password: data.password);
      return null;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return '${e.message}';
    }
  }

  Future<String> _recoverPassword(String name) async {
    debugPrint('Name: $name');
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: name);
      return null;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return '${e.message}';
    }
  }
}
