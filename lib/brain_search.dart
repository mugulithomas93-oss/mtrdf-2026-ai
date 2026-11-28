import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

class BrainChunk {
  final String source;
  final String text;
  BrainChunk({required this.source, required this.text});
}

class BrainSearch {
  static List<BrainChunk> _chunks = [];
  static bool _loaded = false;

  // Load brain.json from phone storage OR from assets
  static Future<void> load() async {
    if (_loaded) return;
    try {
      // 1. Try phone storage first - where you already have it
      final file = File('/storage/emulated/0/Documents/MTRDF books/brain.json');
      if (await file.exists()) {
        final content = await file.readAsString();
        _parse(content);
        _loaded = true;
        return;
      }
    } catch (_) {}
    try {
      // 2. Try assets for other users later
      final content = await rootBundle.loadString('assets/brain.json');
      _parse(content);
      _loaded = true;
    } catch (e) {
      print('Brain not found: $e');
    }
  }

  static void _parse(String content) {
    final List data = jsonDecode(content);
    _chunks = data.map((e) => BrainChunk(
      source: (e['source'] ?? '').toString(),
      text: (e['text'] ?? '').toString(),
    )).toList();
  }

  static int get totalChunks => _chunks.length;

  // Search YOUR books - keyword scoring
  static List<BrainChunk> search(String question, {int limit = 5}) {
    if (_chunks.isEmpty) return [];
    final words = question.toLowerCase()
        .split(RegExp(r'[^a-z0-9]+'))
        .where((w) => w.length > 2)
        .toSet();

    final scored = <Map<String, dynamic>>[];
    for (var c in _chunks) {
      final lower = c.text.toLowerCase();
      int score = 0;
      for (var w in words) {
        if (lower.contains(w)) score++;
      }
      // Bonus if phrase matches
      if (lower.contains(question.toLowerCase())) score += 5;
      if (score > 0) scored.add({'chunk': c, 'score': score});
    }
    scored.sort((a, b) => (b['score'] as int).compareTo(a['score'] as int));
    return scored.take(limit).map((e) => e['chunk'] as BrainChunk).toList();
  }

  // Build context to send to AI
  static String buildContext(String question) {
    final results = search(question);
    if (results.isEmpty) return "No relevant content found in MTRDF books.";
    final buffer = StringBuffer();
    buffer.writeln("Use ONLY the following from MTRDF books to answer:");
    for (var r in results) {
      buffer.writeln("\n--- From: ${r.source} ---");
      buffer.writeln(r.text);
    }
    return buffer.toString();
  }
}
