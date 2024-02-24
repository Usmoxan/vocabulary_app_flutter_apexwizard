import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            height: double.infinity,
            'assets/icons/background_pattern.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Center(
              child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset("assets/icons/ic_launcher.png"))),
        ],
      ),
    );
  }
}
