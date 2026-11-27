import 'package:flutter/material.dart';

void main() => runApp(const MTRDFAIApp());

class MTRDFAIApp extends StatelessWidget {
  const MTRDFAIApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MTRDF - 2026 AI',
      theme: ThemeData(primaryColor: const Color(0xFF1A4D8F), scaffoldBackgroundColor: const Color(0xFFF4F7FB)),
      home: const SplashScreen(),
    );
  }
}

// Global Library - so Upload and Library share same items
List<String> myLibrary = [];

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(20),
        child: Column(children: [
          const SizedBox(height: 20),
          Container(width: 90, height: 90, decoration: BoxDecoration(color: const Color(0xFF1A4D8F), borderRadius: BorderRadius.circular(45), border: Border.all(color: const Color(0xFFFFC107), width: 3)),
            child: const Center(child: Text('@\nmugThomas', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
          const SizedBox(height: 12),
          const Text('MTRDF - 2026 AI', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF1A4D8F))),
          const Text('EDUCATIONAL APP', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold, color: Color(0xFFFFC107))),
          const SizedBox(height: 8),
          const Text('Ugandan Secondary School Teachers\nGeography & History', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(20)),
            child: const Text('Be Loved • Be Respected • Be Successful', style: TextStyle(color: Color(0xFF1A4D8F), fontWeight: FontWeight.bold))),
          const Spacer(),
          Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10)]),
            child: Column(children: [
              TextField(decoration: InputDecoration(labelText: 'Email / Username', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
              const SizedBox(height: 10),
              TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
              const SizedBox(height: 12),
              SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A4D8F), padding: const EdgeInsets.symmetric(vertical: 14)),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen())), child: const Text('LOGIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
            ])),
        ]))),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget menuCard(BuildContext context, String title, String sub, Color color, IconData icon, Widget page) {
    return GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(backgroundColor: color, child: Icon(icon, color: Colors.white)),
          const SizedBox(height: 10), Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ])));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Jambo, Teacher 👋'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16),
        child: GridView.count(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, children: [
          menuCard(context, 'Smart Upload', 'PDF / DOCX / Image', Colors.blue, Icons.upload_file, const UploadScreen()),
          menuCard(context, 'My Organized Library', 'S1 - S6 Sorted', Colors.green, Icons.folder, const LibraryScreen()),
          menuCard(context, 'My Saved Resources', 'Lesson Plans', Colors.orange, Icons.bookmark, const LibraryScreen()),
          menuCard(context, 'AI Studio', 'Summarize • Tests', const Color(0xFF7B1FA2), Icons.auto_awesome, const AIStudioScreen()),
          menuCard(context, 'AI Research', 'UNEB • CBC', Colors.red, Icons.search, const AIStudioScreen()),
          menuCard(context, 'Mwalimu Guide', 'Teacher Help', Colors.teal, Icons.school, const AIStudioScreen()),
          menuCard(context, 'Performance Tracker', 'Marks • Progress', Colors.indigo, Icons.bar_chart, const AIStudioScreen()),
        ])));
  }
}

// ================= UPLOAD - NOW WORKING =================
class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}
class _UploadScreenState extends State<UploadScreen> {
  String level = 'S1'; String subject = 'Geography'; String curriculum = 'CBC';
  final textController = TextEditingController();
  void save(String type) {
    if (textController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('First paste text / title below')));
      return;
    }
    myLibrary.add('$subject • $level • $curriculum • $type: ${textController.text}');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('✅ Saved to Library!')));
    setState(() { textController.clear(); });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Smart Upload Center'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: SingleChildScrollView(padding: const EdgeInsets.all(16),
        child: Column(children: [
          Row(children: [Expanded(child: _typeBtn(Icons.picture_as_pdf, 'Upload PDF', 'PDF')), const SizedBox(width: 10), Expanded(child: _typeBtn(Icons.description, 'Upload DOCX', 'DOCX'))]),
          const SizedBox(height: 10),
          Row(children: [Expanded(child: _typeBtn(Icons.image, 'Upload Image', 'Image')), const SizedBox(width: 10), Expanded(child: _typeBtn(Icons.camera_alt, 'Camera Scan', 'Scan'))]),
          const SizedBox(height: 16),
          TextField(controller: textController, maxLines: 4, decoration: InputDecoration(labelText: 'Paste Text / Title here', hintText: 'e.g. Ways of studying geography', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(value: level, decoration: const InputDecoration(labelText: 'Class Level'), items: ['S1','S2','S3','S4','S5','S6'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v) => setState(() => level = v!)),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(value: subject, decoration: const InputDecoration(labelText: 'Subject'), items: ['Geography','History'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v) => setState(() => subject = v!)),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(value: curriculum, decoration: const InputDecoration(labelText: 'Curriculum'), items: ['CBC','Old Curriculum'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v) => setState(() => curriculum = v!)),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A4D8F)), onPressed: () => save('Paste Text'), child: const Text('Process & Sort to Library', style: TextStyle(color: Colors.white)))),
          const SizedBox(height: 10),
          Text('Saved items: ${myLibrary.length} - See them in My Library', style: const TextStyle(color: Colors.grey)),
        ])));
  }
  Widget _typeBtn(IconData icon, String label, String type) {
    return GestureDetector(onTap: () => save(type), child: Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)), child: Column(children: [Icon(icon, color: const Color(0xFF1A4D8F)), const SizedBox(height: 6), Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))])));
  }
}

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('My Organized Library'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: myLibrary.isEmpty ? const Center(child: Text('No items yet.\nGo to Smart Upload and save one.', textAlign: TextAlign.center)) :
      ListView.builder(itemCount: myLibrary.length, itemBuilder: (_, i) => Card(child: ListTile(leading: const Icon(Icons.folder, color: Color(0xFF1A4D8F)), title: Text(myLibrary[i])))));
  }
}

// ================= AI STUDIO =================
class AIStudioScreen extends StatelessWidget {
  const AIStudioScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final tasks = [
      ['Summarize to Notes', Icons.summarize, Colors.blue],
      ['PDF to CBC Lesson Plan', Icons.menu_book, Colors.green],
      ['PDF to Video', Icons.video_library, Colors.orange],
      ['Solve UNEB Questions', Icons.quiz, Colors.red],
      ['Create Tests', Icons.edit_note, Colors.purple],
    ];
    return Scaffold(appBar: AppBar(title: const Text('AI Research Studio'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(decoration: InputDecoration(hintText: 'Start New AI Task...', prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
          const SizedBox(height: 16),
          ...tasks.map((t) => Card(child: ListTile(leading: CircleAvatar(backgroundColor: t[2] as Color, child: Icon(t[1] as IconData, color: Colors.white)), title: Text(t[0] as String), trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AITaskScreen(title: t[0] as String, color: t[2] as Color)))))).toList(),
        ])));
  }
}

class AITaskScreen extends StatefulWidget {
  final String title; final Color color;
  const AITaskScreen({super.key, required this.title, required this.color});
  @override
  State<AITaskScreen> createState() => _AITaskScreenState();
}

class _AITaskScreenState extends State<AITaskScreen> {
  final inputController = TextEditingController();
  String output = ''; bool loading = false;

  String generate(String title, String input) {
    final low = input.toLowerCase();
    if (input.trim().isEmpty) return 'Please paste or type your topic first.';
    // SPECIAL CASE - Ways of studying Geography
    if (low.contains('ways') && low.contains('geography')) {
      if (title.contains('Create Tests')) {
        return '📝 TEST - Ways of Studying Geography\n\n1. Define Geography. (2 marks)\n2. State FOUR ways of studying Geography. (4 marks)\n   - Fieldwork / Field study\n   - Observation\n   - Use of Maps, Photographs, Charts\n   - Use of Statistics / Data\n   - Experiments / Practical work\n3. Explain TWO advantages of Fieldwork. (4 marks)\n4. Why is observation important in Geography? (3 marks)\n5. Give TWO examples of how maps help in studying Geography. (2 marks)\n\nTotal: 15 marks\n\nMARKING GUIDE:\nQ2: 1 mark each method. Q3: 2 marks per advantage + example.';
      }
      if (title.contains('Summarize')) {
        return '📝 SUMMARY - Ways of Studying Geography\n\nGeography is the study of the earth and how people relate to it.\n\nWAYS:\n1. Fieldwork - Going out to see rivers, hills, markets\n2. Observation - Watching and recording what you see\n3. Maps & Photographs - Reading maps, aerial photos\n4. Statistics - Using numbers, rainfall figures, population data\n5. Experiments - Testing soil, water in class\n\nWhy important? Makes learning real, not just theory.';
      }
      if (title.contains('Lesson Plan')) {
        return '📚 CBC LESSON PLAN - Ways of Studying Geography\n\nClass: S1 | 80 mins\nOUTCOME: Learners state and use ways of studying Geography.\n\nINTRO (10m): Ask - How do we learn about our village?\nDEVELOPMENT (50m):\n- Explain 5 ways: Fieldwork, Observation, Maps, Statistics, Experiments\n- Group work: Each group demonstrates one way\n- Show a map of Uganda and a photo\nASSESSMENT (20m): List 4 ways + give 1 example each.';
      }
    }
    // GENERIC SMART TEMPLATES
    if (title.contains('Summarize')) return '📝 SUMMARY NOTES\n\nTopic: $input\n\n• What it means: Definition of $input\n• Main points / Methods / Factors\n• Examples from Uganda & East Africa\n• Importance to learners\n• Conclusion for revision';
    if (title.contains('Lesson Plan')) return '📚 CBC LESSON PLAN\n\nTopic: $input\nClass: S1-S4 | 80 mins\n\nOUTCOME: Learners should explain $input.\n\nINTRO (10m): Ask what learners know.\nDEVELOPMENT (50m): Define, explain 4 points, group activity, examples.\nASSESSMENT (20m): Oral + written: Explain 3 points about $input.\n\nVALUES: Love, Respect, Hard work';
    if (title.contains('Video')) return '🎬 VIDEO SCRIPT - $input\n\nScene 1: Hook question\nScene 2: Explain with map / picture\nScene 3: 3 Uganda examples\nScene 4: Quick quiz\nScene 5: Summary + homework\n\nTip: 5-7 minutes only.';
    if (title.contains('UNEB')) return '✅ UNEB SOLUTION - $input\n\nSTEP 1: Understand the question\nSTEP 2: Define key terms\nSTEP 3: Give 4 points, each with Explanation + Example from Uganda\nSTEP 4: Conclusion\n\nMarking: Each explained point = 2 marks.';
    return '📝 TEST - $input\n\n1. Define $input. (2 marks)\n2. State FOUR key points about $input. (4 marks)\n3. Explain TWO importance / advantages of $input. (4 marks)\n4. Give TWO examples of $input in Uganda. (2 marks)\n5. Explain ONE challenge related to $input. (3 marks)\n\nTotal: 15 marks';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title), backgroundColor: widget.color, foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: inputController, maxLines: 4, decoration: InputDecoration(labelText: 'Paste topic / question here', hintText: 'e.g. Ways of studying geography', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: widget.color, padding: const EdgeInsets.symmetric(vertical: 14)),
            onPressed: () { setState(() => loading = true); Future.delayed(const Duration(seconds: 1), () { setState(() { output = generate(widget.title, inputController.text); loading = false; }); }); },
            child: loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Generate with MTRDF AI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
          const SizedBox(height: 16),
          Expanded(child: SingleChildScrollView(child: Container(width: double.infinity, padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: Text(output.isEmpty ? 'Your result will appear here...' : output, style: const TextStyle(fontSize: 15, height: 1.5))))),
        ])));
  }
}
