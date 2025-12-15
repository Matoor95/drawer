import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex=0;
  final List<Widget> _pages= const [
    AcceuilPage(),
    AProposPage(),
    ProfilPage()

  ];
  void _selectPage(int index){
    setState(() {
      _selectedIndex=index;
    });
    Navigator.of(context).pop();  // ferme le drawer apres clicc
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // entete du drawer
            DrawerHeader(
              decoration: BoxDecoration(
                color:Colors.blue
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text('Mon Menu', style: TextStyle(color: Colors.white, fontSize: 22),),

              ),
             ),
             // les lien 
             ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Acceuil'),
              selected: _selectedIndex==0,
              onTap: ()=>_selectPage(0),
             ),
                ListTile(
              leading: const Icon(Icons.info),
              title: const Text('A propos'),
              selected: _selectedIndex==1,
              onTap: ()=>_selectPage(1),
             ),
                ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              selected: _selectedIndex==2,
              onTap: ()=>_selectPage(2),
             ),
          ],
          ),

        ),

      
      body:_pages[_selectedIndex],
    );
  }
}

class AcceuilPage extends StatelessWidget {
const AcceuilPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text('Accdeuil page');
  }
}
class AProposPage extends StatelessWidget {
const AProposPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text('Page a propos');
  }
}
class ProfilPage extends StatelessWidget {
const ProfilPage ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text('Profil');
  }
}