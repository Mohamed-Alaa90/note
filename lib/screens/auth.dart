import 'package:flutter/material.dart';


import '../core/supabase/supabase_service.dart';
import 'home.dart';
import 'login_screen.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  static const String route = "auth";

  @override
  Widget build(BuildContext context) {
    final SupabaseService supabaseService = SupabaseService();

    return supabaseService.isLoggedIn() ? Home() : LoginScreen();
  }
}
