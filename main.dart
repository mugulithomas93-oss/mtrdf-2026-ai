import 'package:flutter/material.dart';

void main() => runApp(const MTRDFApp());

class MTRDFApp extends StatelessWidget {
  const MTRDFApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MTRDF 2026 AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final List<Map<String, dynamic>> subjects = const [
    {"name": "Mathematics", "icon": Icons.calculate, "color": Colors.blue},
    {"name": "Biology", "icon": Icons.biotech, "color": Colors.green},
    {"name": "Chemistry", "icon": Icons.science, "color": Colors.orange},
    {"name": "Physics", "icon": Icons.bolt, "color": Colors.purple},
    {"name": "History", "icon": Icons.history_edu, "color": Colors.brown},
    {"name": "Geography", "icon": Icons.public, "color": Colors.teal},
    {"name": "English", "icon": Icons.menu_book, "color": Colors.red},
    {"name": "Agriculture", "icon": Icons.grass, "color": Colors.lightGreen},
    {"name": "Commerce", "icon": Icons.business, "color": Colors.indigo},
    {"name": "ICT", "icon": Icons.computer, "color": Colors.cyan},
    {"name": "RE", "icon": Icons.auto_stories, "color": Colors.amber},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MTRDF 2026 AI", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.green,
            child: const Text("MTRDF Education S1-S4", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: subjects.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 4,
                  child: InkWell(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${subjects[i]['name']} coming soon!"))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(subjects[i]['icon'], size: 48, color: subjects[i]['color']),
                        const SizedBox(height: 10),
                        Text(subjects[i]['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Text("S1 - S4", style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
