import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';


import 'core/constant/app_urls.dart';
import 'features/auth/auth.dart';
import 'features/login/login_screen.dart';
import 'features/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: ApiUrls.url, anonKey: ApiUrls.anon);

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: AppBarTheme(
            color: Colors.grey[300],
          )),
      initialRoute: Auth.route,
      routes: {
        RegisterScreen.route: (context) => const RegisterScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        Auth.route: (context) => const Auth(),
      },
    );
  }
}
