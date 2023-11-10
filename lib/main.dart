import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_app_ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test ui',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
