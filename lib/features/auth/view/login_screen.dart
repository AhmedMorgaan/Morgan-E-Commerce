import 'package:flutter/material.dart';
import 'package:morgan_e_commerce/core/shared/screens/default_screen.dart';

class LoginScreen extends StatelessWidget {
  static final routeName = "/loginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      title: "Login",
      subtitle: "Please enter your credentials to login.",
      child: Column(
        children: [
          // Your login form goes here
        ],
      ),
    );
  }
}
