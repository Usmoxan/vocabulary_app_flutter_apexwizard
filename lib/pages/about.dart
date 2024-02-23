import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ilova haqida"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
                width: 150,
                height: 150,
                child: Image.asset("assets/icons/ic_launcher.png")),
            const Text(
              "Muallif: Soxibova O’g’iloy Nuraliyevna",
              style: TextStyle(fontSize: 25),
            ),
            const Text(
              "Oliy ta'lim muassasasi: Islom Karimov nomidagi TDTU",
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            const Text(
              "Ilova talqini: 1.0.0",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
