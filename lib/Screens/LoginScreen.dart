import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../HomePage.dart';
import '../Models/SignUpData.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => Duration(milliseconds: 2250);

  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Who First',
      // logo: AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  Future<String> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    // ignore: missing_return
    return Future.delayed(loginTime).then((_) async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: data.name, password: data.password);
        return null;
      } on FirebaseAuthException catch (e) {
        debugPrint(e.toString());
        return '${e.message}';
      }
    });
  }

  Future<String> _signupUser(LoginData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }
}
