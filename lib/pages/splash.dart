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
          Center(
              child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset("assets/icons/ic_launcher.png"))),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Powered by",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Image.asset("assets/icons/apex_logo.png"),
                    ),
                  ),
                  const Text(
                    "ApexWizard",
                    style: TextStyle(
                        fontFamily: 'ElMessiri',
                        color: Color.fromARGB(255, 44, 44, 44),
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
