import 'package:flutter/material.dart';

void main() => runApp(const MTRDFAIApp());

class MTRDFAIApp extends StatelessWidget {
  const MTRDFAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MTRDF - 2026 AI',
      theme: ThemeData(
        primaryColor: const Color(0xFF1A4D8F),
        scaffoldBackgroundColor: const Color(0xFFF4F7FB),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

// ================= SPLASH / LOGIN =================
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Logo
              Container(
                width: 90, height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A4D8F),
                  borderRadius: BorderRadius.circular(45),
                  border: Border.all(color: const Color(0xFFFFC107), width: 3),
                ),
                child: const Center(
                  child: Text('@\nmugThomas',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Research and Development Foundation',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.bold)),
              const Text('MTRDF - 2026 AI',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF1A4D8F))),
              const Text('EDUCATIONAL APP',
                style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold, color: Color(0xFFFFC107))),
              const SizedBox(height: 8),
              const Text('Ugandan Secondary School Teachers\nGeography & History',
                textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(20)),
                child: const Text('Be Loved • Be Respected • Be Successful',
                  style: TextStyle(color: Color(0xFF1A4D8F), fontWeight: FontWeight.bold)),
              ),
              const Spacer(),
              // Login Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10)]),
                child: Column(
                  children: [
                    TextField(decoration: InputDecoration(labelText: 'Email / Username', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
                    const SizedBox(height: 10),
                    TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A4D8F), padding: const EdgeInsets.symmetric(vertical: 14)),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
                        child: const Text('LOGIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
                      child: const Text('Continue with Email'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text('Material Design 3 Interface • Uganda', style: TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
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
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(backgroundColor: color, child: Icon(icon, color: Colors.white)),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jambo, Teacher 👋'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12,
          children: [
            menuCard(context, 'Smart Upload', 'PDF / DOCX / Image', Colors.blue, Icons.upload_file, const UploadScreen()),
            menuCard(context, 'My Organized Library', 'S1 - S6 Sorted', Colors.green, Icons.folder, const UploadScreen()),
            menuCard(context, 'My Saved Resources', 'Lesson Plans', Colors.orange, Icons.bookmark, const UploadScreen()),
            menuCard(context, 'AI Studio', 'Summarize • Tests', const Color(0xFF7B1FA2), Icons.auto_awesome, const AIStudioScreen()),
            menuCard(context, 'AI Research', 'UNEB • CBC', Colors.red, Icons.search, const AIStudioScreen()),
            menuCard(context, 'Mwalimu Guide', 'Teacher Help', Colors.teal, Icons.school, const AIStudioScreen()),
            menuCard(context, 'Performance Tracker', 'Marks • Progress', Colors.indigo, Icons.bar_chart, const AIStudioScreen()),
          ],
        ),
      ),
    );
  }
}

// ================= SMART UPLOAD =================
class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Upload Center'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Row(children: [
            Expanded(child: _uploadBtn(Icons.picture_as_pdf, 'Upload PDF')),
            const SizedBox(width: 10),
            Expanded(child: _uploadBtn(Icons.description, 'Upload DOCX')),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _uploadBtn(Icons.image, 'Upload Image')),
            const SizedBox(width: 10),
            Expanded(child: _uploadBtn(Icons.camera_alt, 'Camera Scan')),
          ]),
          const SizedBox(height: 10),
          _uploadBtn(Icons.text_fields, 'Paste Text'),
          const SizedBox(height: 20),
          const Text('Auto-Sort Settings', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(decoration: const InputDecoration(labelText: 'Class Level'), items: ['S1','S2','S3','S4','S5','S6'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (_) {}),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(decoration: const InputDecoration(labelText: 'Subject'), items: ['Geography','History'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (_) {}),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(decoration: const InputDecoration(labelText: 'Curriculum'), items: ['CBC','Old Curriculum'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (_) {}),
          const SizedBox(height: 20),
          SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A4D8F)), onPressed: () {}, child: const Text('Process & Sort to Library', style: TextStyle(color: Colors.white)))),
        ]),
      ),
    );
  }
  Widget _uploadBtn(IconData icon, String label) {
    return Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)), child: Column(children: [Icon(icon, color: const Color(0xFF1A4D8F)), const SizedBox(height: 6), Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))]));
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
    return Scaffold(
      appBar: AppBar(title: const Text('AI Research Studio'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(decoration: InputDecoration(hintText: 'Start New AI Task...', prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
          const SizedBox(height: 16),
          ...tasks.map((t) => Card(child: ListTile(leading: CircleAvatar(backgroundColor: t[2] as Color, child: Icon(t[1] as IconData, color: Colors.white)), title: Text(t[0] as String), trailing: const Icon(Icons.arrow_forward_ios, size: 16)))).toList(),
        ]),
      ),
    );
  }
}
