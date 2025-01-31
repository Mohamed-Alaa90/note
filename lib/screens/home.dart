import 'package:flutter/material.dart';

import '../core/supabase_service.dart';
import '../widget/custom_button.dart';
import 'login_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final SupabaseService _supabaseService = SupabaseService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Hello"),
            CustomButton(
                onPressed: () {
                  _supabaseService.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>  LoginScreen(),
                    ),
                  );
                },
                name: "signOut")
          ],
        ),
      ),
    );
  }
}
