import 'package:flutter/material.dart';
import '../../core/supabase/supabase_service.dart';
import '../../shared/custom_button.dart';
import '../../shared/custom_text_feild.dart';
import '../note/note_screen.dart';
import '../register/register_screen.dart';

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
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const NoteScreen(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
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
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Icon(
                  Icons.lock,
                  size: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  obscureText: false,
                  controller: _email,
                  hintText: "email",
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  obscureText: true,
                  controller: _password,
                  hintText: "password",
                  icon: Icons.password,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () => _login(),
                  name: "Login",
                ),
                const SizedBox(
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
