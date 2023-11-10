import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_app_ui/constants/app_constants.dart';
import 'package:video_app_ui/screens/home_screen.dart';

import '../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration,
        () => Navigator.pushReplacement(context, customPageRoute(const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: AppConstants.primaryGreen,
      body: Center(
        child: Text(
          "Welcome",
          style: TextStyle(
              color: AppConstants.primarytTextColor,
              fontSize: AppConstants.extraLarge,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
