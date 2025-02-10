import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/supabase/supabase_service.dart';
import '../login/login_screen.dart';
import '../note/note_screen.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  static const String route = "auth";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SvgPicture.asset(
        "assets/clipboard.svg",
        fit: BoxFit.contain,
      ),
      nextScreen: SupabaseService().isLoggedIn()
          ? const NoteScreen()
          : const LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 100,
      backgroundColor: Colors.white,
      duration: 2000,
    );
  }
}
