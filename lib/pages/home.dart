import 'package:flutter/material.dart';
import 'package:vocabulary/pages/vocabulary.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> gridData = [
    {
      "name": "Mechanical Engineering",
      "path": "assets/data/mechanical-engineering.json"
    },
    {"name": "Civil Engineering", "path": "assets/data/civil-engineering.json"},
    {
      "name": "Electrical Engineering",
      "path": "assets/data/electrical-engineering.json"
    },
    {
      "name": "Chemical Engineering",
      "path": "assets/data/chemical-engineering.json"
    },
    {
      "name": "Computer Engineering",
      "path": "assets/data/computer-engineering.json"
    },
    {"name": "Aerospace", "path": "assets/data/aerospace.json"},
    {
      "name": "Biomedical Engineering",
      "path": "assets/data/biomedical-engineering.json"
    },
    {
      "name": "Industrial Engineering",
      "path": "assets/data/industrial-engineering.json"
    },
    {
      "name": "Environmental Engineering",
      "path": "assets/data/environmental-engineering.json"
    },
    {
      "name": "Nuclear Engineering",
      "path": "assets/data/nuclear-engineering.json"
    },
    {
      "name": "Telecommunications Engineering",
      "path": "assets/data/telecommunication-engineering.json"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vocabulary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
          ),
          itemCount: gridData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VocabularyScreen(
                      name: gridData[index]['name']!,
                      path: gridData[index]['path']!,
                    ),
                  ),
                );
              },
              child: Card(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        gridData[index]['name']!,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 39, 39, 39),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
