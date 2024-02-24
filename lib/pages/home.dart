import 'package:flutter/material.dart';
import 'package:vocabulary/pages/about.dart';
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
      "path": "assets/data/mechanical-engineering.json",
      "icon_name": "assets/icons/Mechanical.png"
    },
    {
      "name": "Civil Engineering",
      "path": "assets/data/civil-engineering.json",
      "icon_name": "assets/icons/Civil.png"
    },
    {
      "name": "Electrical Engineering",
      "path": "assets/data/electrical-engineering.json",
      "icon_name": "assets/icons/Electrical.png"
    },
    {
      "name": "Chemical Engineering",
      "path": "assets/data/chemical-engineering.json",
      "icon_name": "assets/icons/Chemical.png"
    },
    {
      "name": "Computer Engineering",
      "path": "assets/data/computer-engineering.json",
      "icon_name": "assets/icons/Computer.png"
    },
    {
      "name": "Aerospace",
      "path": "assets/data/aerospace.json",
      "icon_name": "assets/icons/Aerospace.png"
    },
    {
      "name": "Biomedical Engineering",
      "path": "assets/data/biomedical-engineering.json",
      "icon_name": "assets/icons/Biomedical.png"
    },
    {
      "name": "Industrial Engineering",
      "path": "assets/data/industrial-engineering.json",
      "icon_name": "assets/icons/Industrial.png"
    },
    {
      "name": "Environmental Engineering",
      "path": "assets/data/environmental-engineering.json",
      "icon_name": "assets/icons/Environmental.png"
    },
    {
      "name": "Nuclear Engineering",
      "path": "assets/data/nuclear-engineering.json",
      "icon_name": "assets/icons/Nuclear.png"
    },
    {
      "name": "Telecommunications Engineering",
      "path": "assets/data/telecommunication-engineering.json",
      "icon_name": "assets/icons/Telecommunication.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vocabulary for engineering students"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ));
            },
            icon: const Row(
              children: [Icon(Icons.info), Text('Ilova haqida')],
            ),
          )
        ],
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
                      Image.asset(
                        gridData[index]['icon_name']!,
                        width: 100,
                        height: 100,
                      ),
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
