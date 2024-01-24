import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide/page/auth/signinpage.dart';
import 'package:tour_guide/page/userverifypage.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.name,
    required this.phone,
    required this.gender,
    required this.userCredential,
  });
  final String name;
  final String phone;
  final String gender;
  final UserCredential userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return UserVerifyPage(
              name: name,
              phone: phone,
              userCredential: userCredential,
              gender: gender,
            );
          } else {
            return const SigninPage();
          }
        },
      ),
    );
  }
}
