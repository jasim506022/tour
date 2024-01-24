import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_guide/const/gobalcolor.dart';

import '../const/approutes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Home Page",
          style: GoogleFonts.poppins(
              color: black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRouters.signPage, (route) => false);
              });
            },
            icon: Icon(
              Icons.logout,
              color: black,
              size: 30,
            ),
            label: Text(
              "Logout",
              style: GoogleFonts.poppins(
                  color: black, fontWeight: FontWeight.bold, fontSize: 20),
            )),
      ),
    );
  }
}
