import 'package:flutter/material.dart';
import '../../core/supabase/supabase_service.dart';
import '../../shared/custom_button.dart';
import '../../shared/custom_text_feild.dart';
import '../login/login_screen.dart';
import '../note/note_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String route = "register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final SupabaseService _supabaseService = SupabaseService();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _register() async {
    final error = await _supabaseService.register(_email.text, _password.text);
    if (error == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const NoteScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("error register"),
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
                  "Register",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
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
                  onPressed: () => _register(),
                  name: "Register",
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, LoginScreen.route),
                  child: Text(
                    "Do you have account? Login",
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
