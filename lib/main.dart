import 'package:flutter/material.dart';
import 'package:note/screens/auth.dart';
import 'package:note/screens/login_screen.dart';
import 'package:note/screens/register_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import 'core/constant/app_urls.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: ApiUrls.url, anonKey: ApiUrls.anon);

  runApp(
    MyApp(),
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
        RegisterScreen.route: (context) => RegisterScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        Auth.route: (context) => Auth(),
      },
    );
  }
}
