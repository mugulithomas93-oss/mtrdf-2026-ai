import 'package:flutter/material.dart';
void main() => runApp(MTRDFApp());
class MTRDFApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MTRDF 2026 AI',
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _c=0;
  final pages=[LibraryPage(),AIPage(),MwalimuPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('@mugThomas MTRDF - 2026 AI',style: TextStyle(fontSize:14)), backgroundColor: Color(0xFF0D47A1), foregroundColor: Colors.white),
      body: pages[_c],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _c,
        onTap: (i)=>setState(()=>_c=i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'AI Studio'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Mwalimu'),
        ],
      ),
    );
  }
}
class LibraryPage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFF0D47A1), borderRadius: BorderRadius.circular(12)), child: Text('Welcome Mwalimu Thomas! Your S6 Geo files organized.', style: TextStyle(color: Colors.white))),
      SizedBox(height:10),
      Card(child: ListTile(title: Text('Continental Drift & Rift Valley'), subtitle: Text('S6 Geo • 3 files'))),
      Card(child: ListTile(title: Text('Soil Management - Gomba'), subtitle: Text('S6 Geo • 2 files'))),
    ]);
  }
}
class AIPage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2, padding: EdgeInsets.all(16), children: [
      Card(child: Center(child: Text('Summarize Notes'))),
      Card(child: Center(child: Text('CBC Lesson Plan'))),
      Card(child: Center(child: Text('Video Script'))),
      Card(child: Center(child: Text('Solve UNEB'))),
    ]);
  }
}
class MwalimuPage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: [
      Text('Be LOVED, RESPECTED, SUCCESSFUL', style: TextStyle(fontWeight: FontWeight.bold)),
      Card(child: ListTile(title: Text('Be LOVED by Learners'))),
      Card(child: ListTile(title: Text('Be RESPECTED by Admin'))),
      Card(child: ListTile(title: Text('Be SUCCESSFUL'))),
    ]);
  }
}
