import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/login_page.dart';
import 'features/auth/signup_page.dart';
import 'features/auth/reset_password_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://qnwcqauvixqjpekwyyxn.supabase.co',
    anonKey: 'sb_publishable_8zXUTBIC-Zdw8Xz2CPrjZA_D6OhciHn',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeDo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginPage(),
        '/signup': (_) => const SignupPage(),
        '/reset-password': (_) => const ResetPasswordPage(),
      },
    );
  }
}
