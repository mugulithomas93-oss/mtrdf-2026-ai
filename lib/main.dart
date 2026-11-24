import 'package:flutter/material.dart';

void main() {
  runApp(const MtrdfApp());
}

class MtrdfApp extends StatelessWidget {
  const MtrdfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MTRDF AI V16.0',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MTRDF AI V16.0 - Academic Intelligence'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Welcome to MTRDF AI V16.0\nAcademic Intelligence',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
