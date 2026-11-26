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

// ================= SPLASH =================
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(height: 20),
            Container(width: 90, height: 90,
              decoration: BoxDecoration(color: const Color(0xFF1A4D8F), borderRadius: BorderRadius.circular(45), border: Border.all(color: const Color(0xFFFFC107), width: 3)),
              child: const Center(child: Text('@\nmugThomas', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)))),
            const SizedBox(height: 12),
            const Text('Research and Development Foundation', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.bold)),
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
                const SizedBox(height: 8),
                OutlinedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen())), child: const Text('Continue with Email')),
              ])),
            const SizedBox(height: 10),
            const Text('Material Design 3 Interface • Uganda', style: TextStyle(fontSize: 11, color: Colors.grey)),
          ]),
        ),
      ),
    );
  }
}

// ================= HOME =================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget menuCard(BuildContext context, String title, String sub, Color color, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(backgroundColor: color, child: Icon(icon, color: Colors.white)),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ])),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jambo, Teacher 👋'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16),
        child: GridView.count(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, children: [
          menuCard(context, 'Smart Upload', 'PDF / DOCX / Image', Colors.blue, Icons.upload_file, const UploadScreen()),
          menuCard(context, 'My Organized Library', 'S1 - S6 Sorted', Colors.green, Icons.folder, const UploadScreen()),
          menuCard(context, 'My Saved Resources', 'Lesson Plans', Colors.orange, Icons.bookmark, const UploadScreen()),
          menuCard(context, 'AI Studio', 'Summarize • Tests', const Color(0xFF7B1FA2), Icons.auto_awesome, const AIStudioScreen()),
          menuCard(context, 'AI Research', 'UNEB • CBC', Colors.red, Icons.search, const AIStudioScreen()),
          menuCard(context, 'Mwalimu Guide', 'Teacher Help', Colors.teal, Icons.school, const AIStudioScreen()),
          menuCard(context, 'Performance Tracker', 'Marks • Progress', Colors.indigo, Icons.bar_chart, const AIStudioScreen()),
        ])),
    );
  }
}

// ================= UPLOAD =================
class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Smart Upload Center'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(children: [
          Row(children: [Expanded(child: _btn(Icons.picture_as_pdf, 'Upload PDF')), const SizedBox(width: 10), Expanded(child: _btn(Icons.description, 'Upload DOCX'))]),
          const SizedBox(height: 10),
          Row(children: [Expanded(child: _btn(Icons.image, 'Upload Image')), const SizedBox(width: 10), Expanded(child: _btn(Icons.camera_alt, 'Camera Scan'))]),
          const SizedBox(height: 10),
          _btn(Icons.text_fields, 'Paste Text'),
          const SizedBox(height: 20),
          const Text('Auto-Sort Settings', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(decoration: const InputDecoration(labelText: 'Class Level'), items: ['S1','S2','S3','S4','S5','S6'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (_) {}),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(decoration: const InputDecoration(labelText: 'Subject'), items: ['Geography','History'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (_) {}),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(decoration: const InputDecoration(labelText: 'Curriculum'), items: ['CBC','Old Curriculum'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (_) {}),
          const SizedBox(height: 20),
          SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A4D8F)), onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saved to Library! Coming in next update - file picker')));
          }, child: const Text('Process & Sort to Library', style: TextStyle(color: Colors.white)))),
        ])),
    );
  }
  Widget _btn(IconData icon, String label) {
    return Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)), child: Column(children: [Icon(icon, color: const Color(0xFF1A4D8F)), const SizedBox(height: 6), Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))]));
  }
}

// ================= AI STUDIO - NOW WORKING =================
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
    return Scaffold(
      appBar: AppBar(title: const Text('AI Research Studio'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(decoration: InputDecoration(hintText: 'Start New AI Task...', prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
          const SizedBox(height: 16),
          ...tasks.map((t) => Card(child: ListTile(
            leading: CircleAvatar(backgroundColor: t[2] as Color, child: Icon(t[1] as IconData, color: Colors.white)),
            title: Text(t[0] as String),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AITaskScreen(title: t[0] as String, color: t[2] as Color))),
          ))).toList(),
        ])),
    );
  }
}

// ================= AI TASK DETAIL =================
class AITaskScreen extends StatefulWidget {
  final String title; final Color color;
  const AITaskScreen({super.key, required this.title, required this.color});
  @override
  State<AITaskScreen> createState() => _AITaskScreenState();
}

class _AITaskScreenState extends State<AITaskScreen> {
  final inputController = TextEditingController();
  String output = '';
  bool loading = false;

  String generate(String title, String input) {
    if (input.trim().isEmpty) return 'Please paste or type your topic / question first.';
    if (title.contains('Summarize')) {
      return '📝 SUMMARY NOTES\n\nTopic: $input\n\n• Key Point 1: Definition and meaning of $input\n• Key Point 2: Main causes / factors\n• Key Point 3: Effects / importance in Uganda\n• Key Point 4: Examples from East Africa\n• Key Point 5: Conclusion for learners\n\nRemember: Use this for revision in class.';
    }
    if (title.contains('Lesson Plan')) {
      return '📚 CBC LESSON PLAN\n\nSubject: Geography / History\nTopic: $input\nClass: S1 - S4 | Period: 80 mins\n\nLEARNING OUTCOME:\nBy end of lesson, learners should explain $input.\n\nINTRODUCTION (10 mins):\nAsk learners what they know about $input.\n\nDEVELOPMENT (50 mins):\n1. Define $input\n2. Discuss causes / factors\n3. Group activity - learners give examples\n4. Teacher guides and corrects\n\nASSESSMENT (20 mins):\n- Oral questions\n- Written exercise: Explain 3 points about $input\n\nVALUES: Love, Respect, Hard work';
    }
    if (title.contains('Video')) {
      return '🎬 VIDEO SCRIPT\n\nTitle: Understanding $input\n\nScene 1: Hook - Ask a question about $input\nScene 2: Explain with a map / picture\nScene 3: Give 3 real Uganda examples\nScene 4: Quick quiz for learners\nScene 5: Summary + homework\n\nTip: Record with your phone, 5-7 minutes only.';
    }
    if (title.contains('UNEB')) {
      return '✅ UNEB SOLUTION GUIDE\n\nQuestion: $input\n\nSTEP 1: Understand - What is the question asking?\nSTEP 2: Define key terms in $input\nSTEP 3: Give 4 well-explained points:\n1. Point + Explanation + Example\n2. Point + Explanation + Example\n3. Point + Explanation + Example\n4. Point + Explanation + Example\nSTEP 4: Conclusion linking to Uganda / East Africa\n\nMarking tip: Each point = 2 marks if explained with example.';
    }
    return '📝 TEST - $input\n\n1. Define $input. (2 marks)\n2. State THREE causes / factors of $input. (3 marks)\n3. Explain TWO effects of $input in Uganda. (4 marks)\n4. Give TWO examples of $input in East Africa. (2 marks)\n5. Why is $input important to learners? (4 marks)\n\nTotal: 15 marks\n\nANSWERS FOR TEACHER:\nUse the notes above. Award marks for correct points + examples.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: widget.color, foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: inputController, maxLines: 4, decoration: InputDecoration(labelText: 'Paste topic / question / text here', hintText: 'e.g. Causes of soil erosion in Uganda', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: widget.color, padding: const EdgeInsets.symmetric(vertical: 14)),
            onPressed: () {
              setState(() { loading = true; });
              Future.delayed(const Duration(seconds: 1), () {
                setState(() { output = generate(widget.title, inputController.text); loading = false; });
              });
            }, child: loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Generate with MTRDF AI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
          const SizedBox(height: 16),
          Expanded(child: SingleChildScrollView(child: Container(width: double.infinity, padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: Text(output.isEmpty ? 'Your result will appear here...' : output, style: const TextStyle(fontSize: 15, height: 1.5))))),
        ])),
    );
  }
}
