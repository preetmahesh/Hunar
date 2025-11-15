// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/messages_screen.dart';
import 'screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA4isEQH1Qd625mr2ppL_CvfsHzJc32eKM",
      authDomain: "hunar-f52ec.firebaseapp.com",
      projectId: "hunar-f52ec",
      storageBucket: "hunar-f52ec.firebasestorage.app",
      messagingSenderId: "885020786433",
      appId: "1:885020786433:web:f9f86fc45916713b496500",
    ),
  );
  runApp(const HunarApp());
}

class HunarApp extends StatelessWidget {
  const HunarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const ServicesPage(),
        '/search': (context) => const SearchPage(),
        '/messages': (context) => const MessagesPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}