// vocabulary_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocabulary/pages/about.dart';
import 'package:vocabulary/services/vocabulary_service.dart';

import '../model/vocabulary_item.dart';

class VocabularyScreen extends StatefulWidget {
  final String path;
  final String name;
  const VocabularyScreen({super.key, required this.path, required this.name});

  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  late Future<List<VocabularyItem>> vocabulary;
  String searchQuery = ''; // Hold the search query entered by the user

  @override
  void initState() {
    super.initState();
    vocabulary = VocabularyService().getVocabulary(widget.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
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
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<VocabularyItem>>(
          future: vocabulary,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // Filter the list based on the search query
              List<VocabularyItem> filteredList = snapshot.data!.where((item) {
                return item.term
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase()) ||
                    item.definition
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase());
              }).toList();

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Izlash',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          // Update the search query
                          searchQuery = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        VocabularyItem item = filteredList[index];
                        return GestureDetector(
                          onTap: () {
                            _showDialog(context, item.term, item.definition);
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(
                                item.term,
                                style: const TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                item.definition,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 109, 109, 109)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String text1, String text2) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            text1,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                text2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Yopish'),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Logic to copy message
                      Clipboard.setData(ClipboardData(text: "$text1 - $text2"));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Nusxa olindi')),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Nusxa olish'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
