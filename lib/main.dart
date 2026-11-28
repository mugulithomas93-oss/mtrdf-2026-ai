import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'brain_search.dart';

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

List<String> myLibrary = [];

// ================= SPLASH =================
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
          const Text('Research and Development Foundation', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.bold)),
          const Text('MTRDF - 2026 AI', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF1A4D8F))),
          const Text('EDUCATIONAL APP', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold, color: Color(0xFFFFC107))),
          const SizedBox(height: 8),
          const Text('Ugandan Secondary School Teachers\nGeography & History', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(20)),
            child: const Text('Be Loved • Be Respected • Be Successful', style: const TextStyle(color: Color(0xFF1A4D8F), fontWeight: FontWeight.bold))),
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
        ]))),
    );
  }
}

// ================= HOME =================
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

// ================= UPLOAD - REAL =================
class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}
class _UploadScreenState extends State<UploadScreen> {
  String level = 'S1'; String subject = 'Geography'; String curriculum = 'CBC';
  final textController = TextEditingController();
  String pickedFileName = 'No file picked yet';

  void save(String type, String fileName) {
    myLibrary.add('$subject • $level • $curriculum • $type: $fileName ${textController.text}');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('✅ Saved: $fileName to Library!')));
    setState(() { pickedFileName = fileName; });
  }

  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) save('PDF', result.files.single.name);
    else ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No PDF selected')));
  }
  Future<void> pickDOCX() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['docx','doc']);
    if (result != null) save('DOCX', result.files.single.name);
    else ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No DOCX selected')));
  }
  Future<void> pickImage() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) save('Image', image.name);
    else ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No image selected')));
  }
  Future<void> pickCamera() async {
    final XFile? photo = await ImagePicker().pickImage(source: ImageSource.camera);
    if (photo != null) save('Camera Scan', photo.name);
    else ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No photo taken')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Smart Upload Center'), backgroundColor: const Color(0xFF1A4D8F), foregroundColor: Colors.white),
      body: SingleChildScrollView(padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(12)),
            child: Text('📁 Picked: $pickedFileName', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A4D8F)))),
          const SizedBox(height: 12),
          Row(children: [Expanded(child: _typeBtn(Icons.picture_as_pdf, 'Upload PDF', pickPDF)), const SizedBox(width: 10), Expanded(child: _typeBtn(Icons.description, 'Upload DOCX', pickDOCX))]),
          const SizedBox(height: 10),
          Row(children: [Expanded(child: _typeBtn(Icons.image, 'Upload Image', pickImage)), const SizedBox(width: 10), Expanded(child: _typeBtn(Icons.camera_alt, 'Camera Scan', pickCamera))]),
          const SizedBox(height: 16),
          TextField(controller: textController, maxLines: 2, decoration: InputDecoration(labelText: 'Title / Notes (optional)', hintText: 'e.g. Ways of studying geography', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(value: level, decoration: const InputDecoration(labelText: 'Class Level'), items: ['S1','S2','S3','S4','S5','S6'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v) => setState(() => level = v!)),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(value: subject, decoration: const InputDecoration(labelText: 'Subject'), items: ['Geography','History'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v) => setState(() => subject = v!)),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(value: curriculum, decoration: const InputDecoration(labelText: 'Curriculum'), items: ['CBC','Old Curriculum'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v) => setState(() => curriculum = v!)),
          const SizedBox(height: 16),
          Text('Saved items: ${myLibrary.length} - See them in My Library', style: const TextStyle(color: Colors.grey)),
        ])));
  }
  Widget _typeBtn(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(onTap: onTap, child: Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)), child: Column(children: [Icon(icon, color: const Color(0xFF1A4D8F)), const SizedBox(height: 6), Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))])));
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
  String brainStatus = 'Loading MTRDF Brain...';

  @override
  void initState() {
    super.initState();
    BrainSearch.load().then((_) {
      setState(() {
        brainStatus = 'Brain ready: ${BrainSearch.totalChunks} chunks from your books';
      });
    });
  }

  String generate(String title, String input) {
    final low = input.toLowerCase();
    if (input.trim().isEmpty) return 'Please paste or type your topic first.';

    // --- WAYS OF STUDYING GEOGRAPHY ---
    if (low.contains('ways') && low.contains('geography')) {
      if (title.contains('Create Tests')) return '📝 TEST - Ways of Studying Geography\n\n1. Define Geography. (2 marks)\n2. State FOUR ways of studying Geography. (4 marks)\n   - Fieldwork / Field study\n   - Observation\n   - Use of Maps, Photographs, Charts\n   - Use of Statistics / Data\n   - Experiments / Practical work\n3. Explain TWO advantages of Fieldwork. (4 marks)\n4. Why is observation important in Geography? (3 marks)\n5. Give TWO examples of how maps help in studying Geography. (2 marks)\n\nTotal: 15 marks\n\nMARKING GUIDE:\nQ2: 1 mark each method. Q3: 2 marks per advantage + example.';
      if (title.contains('Summarize')) return '📝 SUMMARY - Ways of Studying Geography\n\nGeography is the study of the earth and how people relate to it.\n\nWAYS:\n1. Fieldwork - Going out to see rivers, hills, markets\n2. Observation - Watching and recording what you see\n3. Maps & Photographs - Reading maps, aerial photos\n4. Statistics - Using numbers, rainfall figures, population data\n5. Experiments - Testing soil, water in class\n\nWhy important? Makes learning real, not just theory.';
      if (title.contains('Lesson Plan')) return '📚 CBC LESSON PLAN - Ways of Studying Geography\n\nClass: S1 | 80 mins\nOUTCOME: Learners state and use ways of studying Geography.\n\nINTRO (10m): Ask - How do we learn about our village?\nDEVELOPMENT (50m):\n- Explain 5 ways: Fieldwork, Observation, Maps, Statistics, Experiments\n- Group work: Each group demonstrates one way\n- Show a map of Uganda and a photo\nASSESSMENT (20m): List 4 ways + give 1 example each.';
    }

    // --- IMPORTANCE OF STUDYING GEOGRAPHY ---
    if (low.contains('importance') || low.contains('importantance')) {
      if (title.contains('Lesson Plan')) return '📚 CBC LESSON PLAN - Importance of Studying Geography\n\nClass: S1 | 80 mins\n\nLEARNING OUTCOME:\nLearners should explain 5 importances of studying Geography.\n\nINTRO (10m):\nAsk: Why do we learn Geography? Let learners give their own reasons.\n\nDEVELOPMENT (50m):\n1. Understand environment - weather, soil, rivers in Uganda\n2. Helps in planning - schools, roads, towns, farms\n3. Understand people & cultures - how people live in Karamoja vs Buganda\n4. Creates jobs - teacher, surveyor, meteorologist, tour guide, town planner\n5. Protect environment - deforestation, soil erosion, pollution\n6. Helps farming - climate, soil, rainfall for crops\n7. Solves problems - floods in Kasese, drought in Karamoja, landslides in Bududa\n\nGROUP ACTIVITY:\nEach group takes 1 importance and presents with a Uganda example.\n\nASSESSMENT (20m):\nWrite 5 importances, each with 1 example.\n\nVALUES: Love, Respect, Hard work';
      if (title.contains('Summarize')) return '📝 SUMMARY - Importance of Studying Geography\n\n1. Understand environment - weather, soil, rivers\n2. Planning - roads, schools, towns\n3. Understand people & cultures\n4. Jobs - teacher, surveyor, meteorologist, tour guide\n5. Protect environment - stop deforestation, erosion\n6. Helps farming - know climate & soil\n7. Solves problems - floods, drought, landslides';
      if (title.contains('Create Tests')) return '📝 TEST - Importance of Studying Geography\n\n1. Define Geography. (2 marks)\n2. State FIVE importances of studying Geography. (5 marks)\n3. Explain how Geography helps a farmer in Uganda. (3 marks)\n4. Give TWO careers a Geography student can do. (2 marks)\n5. How does Geography help protect the environment? (3 marks)\n\nTotal: 15 marks';
    }

    // --- LAKES + INVESTMENT ---
    if (low.contains('lake') && low.contains('investment')) {
      return '✅ UNEB SOLUTION\n\nQuestion: $input\n\n1. FISHING - Nile Perch, Tilapia in L. Victoria, L. Kyoga for food and sale.\n2. FISH FARMING - Cage farming and fish ponds on lakes.\n3. TOURISM - Hotels, beaches at Entebbe, Jinja, Ssese Islands. Boat rides, bird watching.\n4. WATER TRANSPORT - Ferries like MV Kalangala, boats moving people and goods.\n5. IRRIGATION - Using lake water for rice, vegetables in dry season.\n6. HYDRO-ELECTRIC POWER - Nalubaale & Kiira dams at Jinja from L. Victoria.\n7. SAND MINING - Sand from shores for construction.\n8. WATER SUPPLY - Clean water for towns and bottling.\n\nConclusion: Lakes provide jobs, food, electricity and income.\n\nMarking: 1 mark per well-explained opportunity.';
    }

    // --- SOIL EROSION ---
    if (low.contains('soil') && low.contains('erosion')) {
      if (title.contains('Create Tests')) return '📝 TEST - Soil Erosion\n\n1. Define soil erosion. (2 marks)\n2. State FOUR causes of soil erosion. (4 marks)\n3. Explain TWO effects of soil erosion in Uganda. (4 marks)\n4. State FOUR ways of controlling soil erosion. (4 marks)\n\nTotal: 14 marks';
      return '✅ UNEB SOLUTION - Soil Erosion\n\nCAUSES:\n1. Deforestation - trees removed, soil exposed\n2. Overgrazing - animals eat all grass\n3. Poor farming - farming on steep slopes\n4. Heavy rainfall - washes topsoil\n\nEFFECTS:\n- Loss of fertile topsoil, low yields, famine, silting of rivers\n\nCONTROL:\n1. Terracing 2. Planting trees 3. Contour ploughing 4. Mulching 5. Crop rotation\n\nMarking: Each point + example = 2 marks.';
    }

    // --- GENERIC FALLBACK ---
    if (title.contains('Summarize')) return '📝 SUMMARY NOTES\n\nTopic: $input\n\n• What it means: Definition of $input\n• Main points / Methods / Factors\n• Examples from Uganda & East Africa\n• Importance to learners\n• Conclusion for revision';
    if (title.contains('Lesson Plan')) return '📚 CBC LESSON PLAN\n\nTopic: $input\nClass: S1-S4 | 80 mins\n\nOUTCOME: Learners should explain $input.\n\nINTRO (10m): Ask what learners know.\nDEVELOPMENT (50m): Define, explain 4 points, group activity, examples.\nASSESSMENT (20m): Oral + written: Explain 3 points about $input.\n\nVALUES: Love, Respect, Hard work';
    if (title.contains('Video')) return '🎬 VIDEO SCRIPT - $input\n\nScene 1: Hook question\nScene 2: Explain with map / picture\nScene 3: 3 Uganda examples\nScene 4: Quick quiz\nScene 5: Summary + homework\n\nTip: 5-7 minutes only.';
    if (title.contains('UNEB')) return '✅ UNEB SOLUTION - $input\n\nSTEP 1: Define key terms\nSTEP 2: Give 4 points, each with Explanation + Example from Uganda\nSTEP 3: Conclusion\n\nMarking: Each explained point = 2 marks.';
    return '📝 TEST - $input\n\n1. Define $input. (2 marks)\n2. State FOUR key points about $input. (4 marks)\n3. Explain TWO importance / advantages of $input. (4 marks)\n4. Give TWO examples of $input in Uganda. (2 marks)\n5. Explain ONE challenge related to $input. (3 marks)\n\nTotal: 15 marks';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title), backgroundColor: widget.color, foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(children: [
          Text(brainStatus, style: const TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(controller: inputController, maxLines: 4, decoration: InputDecoration(labelText: 'Paste topic / question here', hintText: 'e.g. Ways of studying geography', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: widget.color, padding: const EdgeInsets.symmetric(vertical: 14)),
            onPressed: () { setState(() => loading = true); Future.delayed(const Duration(seconds: 1), () { setState(() { final brain = BrainSearch.buildContext(inputController.text); output = generate(widget.title, inputController.text) + '\n\n--- FROM YOUR MTRDF BOOKS ---\n' + brain; loading = false; }); }); },
            child: loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Generate with MTRDF AI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
          const SizedBox(height: 16),
          Expanded(child: SingleChildScrollView(child: Container(width: double.infinity, padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: Text(output.isEmpty ? 'Your result will appear here...' : output, style: const TextStyle(fontSize: 15, height: 1.5))))),
        ])));
  }
}
