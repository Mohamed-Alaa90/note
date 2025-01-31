import 'package:flutter/material.dart';
import 'package:note/screens/register_screen.dart';

import '../core/supabase_service.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_feild.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String route = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final SupabaseService _supabaseService = SupabaseService();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _login() async {
    final error = await _supabaseService.login(_email.text, _password.text);
    if (error == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("error"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.lock,
                  size: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  obscureText: false,
                  controller: _email,
                  hintText: "email",
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  obscureText: true,
                  controller: _password,
                  hintText: "password",
                  icon: Icons.password,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () => _login(),
                  name: "Login",
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () => Navigator.popAndPushNamed(
                    context,
                    RegisterScreen.route,
                  ),
                  child: Text(
                    "Don't have an account? Register",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
